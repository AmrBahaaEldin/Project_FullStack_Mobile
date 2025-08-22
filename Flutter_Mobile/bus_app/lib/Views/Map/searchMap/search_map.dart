import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../layout/Home_Screen/home_screen.dart';



class SearchMap extends StatefulWidget {
  final LatLng fixedBluePoint;

  const SearchMap({Key? key, required this.fixedBluePoint}) : super(key: key);

  @override
  _SearchMapState createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {
  LatLng? liveLocation;
  late MapController _mapController;
  late LatLng fixedBluePoint;
  List<LatLng> routeCoordinates = [];
  String distanceAndTime = '';
  bool hasArrived = false;
  double thresholdDistance = 10;
  bool shouldDrawPolyline = false;
  double currentZoom = 16;
  StreamSubscription<Position>? _positionStreamSubscription;

  @override
  void initState() {
    super.initState();
    fixedBluePoint = widget.fixedBluePoint;
    _initializeMapController();
    _startTrackingLocation();
  }

  void _initializeMapController() {
    _mapController = MapController();
  }

  void _startTrackingLocation() {
    final locationStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 5,
      ),
    );

    _positionStreamSubscription = locationStream.listen((Position position) {
      if (!mounted) return; // تحقق مما إذا كان الكائن لا يزال مركبًا
      setState(() {
        liveLocation = LatLng(position.latitude, position.longitude);
        _checkDistanceAndUpdatePolyline();
        _mapController.move(liveLocation!, currentZoom);
        _checkArrival();
      });
    });
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel(); // إلغاء الاشتراك
    super.dispose();
  }

  void _checkDistanceAndUpdatePolyline() {
    if (liveLocation == null) {
      return;
    }

    double distance = Geolocator.distanceBetween(
      liveLocation!.latitude,
      liveLocation!.longitude,
      fixedBluePoint.latitude,
      fixedBluePoint.longitude,
    );

    shouldDrawPolyline = distance > thresholdDistance;

    if (shouldDrawPolyline) {
      _fetchRoute();
    } else {
      setState(() {
        routeCoordinates = [];
      });
    }

    setState(() {
      distanceAndTime = "المسافة: ${distance.toStringAsFixed(2)} م";
    });
  }

  Future<void> _fetchRoute() async {
    if (liveLocation == null || !shouldDrawPolyline) {
      return;
    }

    final response = await http.get(
      Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/${liveLocation!.longitude},${liveLocation!.latitude};${fixedBluePoint.longitude},${fixedBluePoint.latitude}?overview=full&geometries=geojson',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List coordinates = data['routes'][0]['geometry']['coordinates'];

      setState(() {
        routeCoordinates = coordinates.map((c) {
          return LatLng(c[1], c[0]);
        }).toList();

        final duration = data['routes'][0]['duration'] / 60;
        distanceAndTime += ", الوقت: ${duration.toStringAsFixed(2)} دقائق";
      });
    } else {
      _showSnackBar("Error fetching route.");
    }
  }

  void _checkArrival() {
    if (liveLocation == null) {
      return;
    }

    double distance = Geolocator.distanceBetween(
      liveLocation!.latitude,
      liveLocation!.longitude,
      fixedBluePoint.latitude,
      fixedBluePoint.longitude,
    );

    if (distance < 2 && !hasArrived) {
      hasArrived = true;
      _showArrivalDialog();
    }
  }

  void _showArrivalDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("تم الوصول", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue)),
          content: const Text("لقد وصلت إلى المحطة .", style: TextStyle(fontSize: 15, color: Colors.grey)),
          actions: [
            TextButton(
              onPressed: () {
                navigateToNewPage();
              },
              child: const Text("الخروج"),
            ),
          ],
        );
      },
    );
  }



  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void navigateToNewPage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
          (Route<dynamic> route) => false, // إزالة جميع الصفحات السابقة
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(image: AssetImage("asset/image/Bus Stop-pana.png"), width: 80),
        title: const Center(
          child: Text(
            "CTA bus service",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }), (route) => false);
            },
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: liveLocation ?? const LatLng(0, 0),
              initialZoom: currentZoom,
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) {
                  currentZoom = position.zoom!;
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                errorTileCallback: (tile, error, stackTrace) {
                  print("Error loading map tiles: ${error.toString()}");
                  //_showSnackBar();
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
                        Icons.person,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: fixedBluePoint,
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                ],
              ),
              if (shouldDrawPolyline && routeCoordinates.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: routeCoordinates,
                      color: Colors.greenAccent,
                      strokeWidth: 4.0,
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                _showArrivalDialog();
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("اغلاق"),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            color: Colors.white,
            height: 25,
            child: Text(
              distanceAndTime,
              style: const TextStyle(color: Colors.brown, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
