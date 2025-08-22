import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // للتعامل مع النقاط والمسافات
import 'package:geolocator/geolocator.dart'; // للحصول على الموقع المباشر
import 'package:http/http.dart' as http; // لإرسال طلبات HTTP
import 'dart:convert';

import '../../../data/web_server/connect_app_api.dart';

class UserMap extends StatefulWidget {
  const UserMap({super.key});

  @override
  _UserMapState createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  late WebServices webServices;
  List<dynamic> _stations = [];
  List<Marker> _markers = [];
  LatLng? liveLocation; // الموقع المباشر
  LatLng? userSelectedLocation; // الموقع الذي يختاره المستخدم
  List<LatLng> routeCoordinates = []; // نقاط المسار بين النقطتين
  String distanceText = '';
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    webServices = WebServices();
    _mapController = MapController(); // تهيئة MapController
    _initialize();
  }

  Future<void> _initialize() async {
    // عرض النقاط أولاً
    await _fetchStations();
    // ثم الحصول على الموقع
    await _checkPermissionsAndGetLocation();
  }

  Future<void> _fetchStations() async {
    try {
      final stations = await webServices.getAllStations();
      if (mounted) {
        setState(() {
          _stations = stations;
          _markers = _stations.map((station) {
            return Marker(
              point: LatLng(
                double.parse(station['latitude']),
                double.parse(station['longitude']),
              ),
              width: 50,
              height: 50,
              child: Tooltip(
                message: "اضغط هنا للحصول على معلومات",
                child: GestureDetector(
                  onTap: () {
                    _showStationInfo(station['name']);
                  },
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.orange,
                    size: 40,
                  ),
                ),
              ),
            );
          }).toList();
        });
      }
    } catch (e) {
      if (mounted) {
        _showSnackBarWithRetry("فشل في تحميل بيانات المحطات. يرجى التحقق من الاتصال بالشبكة.");
      }
    }
  }

  void _showStationInfo(String stationName) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text("محطة: $stationName",style: const TextStyle(fontWeight: FontWeight.bold),)),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> _checkPermissionsAndGetLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          _showSnackBarWithRetry("GPS غير مفعل. يرجى تفعيله.");
        }
        return;
      }
    }
    if (!(await Geolocator.isLocationServiceEnabled())) {
      if (mounted) {
        _showSnackBarWithRetry("GPS مغلق. يرجى تفعيله.");
      }
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      if (mounted) {
        setState(() {
          liveLocation = LatLng(position.latitude, position.longitude); // احصل على الموقع المباشر
          _mapController.move(liveLocation!, 20);
        });
      }
    } catch (e) {
      if (mounted) {
        _showSnackBarWithRetry("حدث خطأ في الحصول على الموقع. يرجى المحاولة مرة أخرى.");
      }
    }
  }

  void _showSnackBarWithRetry(String message) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(message),
                ),
                ElevatedButton(
                  onPressed: _checkPermissionsAndGetLocation,
                  child: const Text("محاولة"),
                ),
              ],
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
    );
  }

  Future<void> _getRoute() async {
    if (liveLocation == null || userSelectedLocation == null) {
      if (mounted) {
        _showSnackBarWithRetry("الرجاء التأكد من تشغيل GPS قبل تحديد المسار.");
      }
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
            'http://router.project-osrm.org/route/v1/driving/${liveLocation!.longitude},${liveLocation!.latitude};${userSelectedLocation!.longitude},${userSelectedLocation!.latitude}?overview=full&geometries=geojson'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final List coordinates = data['routes'][0]['geometry']['coordinates'];

        routeCoordinates = coordinates.map((c) {
          return LatLng(c[1], c[0]);
        }).toList();

        const distanceCalculator = Distance();
        double distanceInMeters = distanceCalculator.as(
            LengthUnit.Meter, liveLocation!, userSelectedLocation!);
        distanceText = 'المسافة: ${distanceInMeters.toStringAsFixed(2)} متر';

        if (mounted) {
          setState(() {});
        }
      } else {
        if (mounted) {
          _showSnackBarWithRetry("فشل في الحصول على المسار. يرجى التحقق من الاتصال بالشبكة.");
        }
      }
    } catch (e) {
      if (mounted) {
        _showSnackBarWithRetry("حدث خطأ في الاتصال. يرجى التحقق من الاتصال بالشبكة.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _markers.isEmpty
          ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF0057FF),
          ))
          : Column(
        children: [
          Text(
            distanceText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: liveLocation ?? const LatLng(0, 0),
                initialZoom: 18,
                onTap: (tapPosition, point) async {
                  if (!(await Geolocator.isLocationServiceEnabled())) {
                    if (mounted) {
                      _showSnackBarWithRetry("GPS مغلق. يرجى تفعيله.");
                    }
                    return;
                  }

                  userSelectedLocation = point;
                  await _getRoute();

                  if (mounted) {
                    setState(() {});
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  errorTileCallback: (tile, error, stackTrace) {
                    if (mounted) {
                      _showSnackBarWithRetry("حدث خطأ أثناء تحميل الخريطة. يرجى التحقق من الاتصال بالشبكة.");
                    }
                  },
                ),
                if (liveLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: liveLocation!,
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                if (userSelectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: userSelectedLocation!,
                        width: 80,
                        height: 80,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                if (routeCoordinates.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: routeCoordinates,
                        color: Colors.blue,
                        strokeWidth: 4.0,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: _markers,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
