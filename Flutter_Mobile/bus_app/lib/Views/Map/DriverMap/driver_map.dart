import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../shared/components/components.dart';

class DriverMap extends StatefulWidget {
  final List<LatLng> stationLocations;
  final LatLng liveLocation;

  const DriverMap({Key? key, required this.stationLocations, required this.liveLocation}) : super(key: key);

  @override
  _DriverMapState createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {
  List<LatLng> routeCoordinates = [];
  late MapController _mapController;
  late LatLng liveLocation;
  double currentZoom = 16;
  bool routeFinished = false;
  List<LatLng> remainingStations = [];

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _getRoute() async {
    if (widget.stationLocations.isEmpty) {
      _showSnackBar("لا توجد نقاط متاحة.");
      return;
    }

    final waypoints = widget.stationLocations
        .map((point) => "${point.longitude},${point.latitude}")
        .join(';');

    final response = await http.get(
      Uri.parse('http://router.project-osrm.org/route/v1/driving/$waypoints?overview=full&geometries=geojson'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List coordinates = data['routes'][0]['geometry']['coordinates'];

      setState(() {
        routeCoordinates = coordinates.map((c) => LatLng(c[1], c[0])).toList();
        remainingStations = List.from(widget.stationLocations);
      });
    } else {
      _showSnackBar("حدث خطأ في الحصول على المسار.");
    }
  }

  void _checkIfRouteFinished() {
    if (remainingStations.isEmpty) {
      setState(() {
        routeFinished = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    liveLocation = widget.liveLocation;
    _mapController = MapController();
    _getRoute();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: liveLocation,
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
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: liveLocation,
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
                markers: remainingStations.map((latLng) => Marker(
                  point: latLng,
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.orange,
                    size: 50,
                  ),
                )).toList(),
              ),
            ],
          ),
          if (routeFinished)
            Center(
              child: AlertDialog(
                title: const Text("انتهت الرحلة"),
                content: const Text("تم الوصول إلى جميع المحطات."),
                actions: [
                  TextButton(
                    onPressed: () {
                      navigateBack(context, true);
                    },
                    child: const Text("العودة"),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
