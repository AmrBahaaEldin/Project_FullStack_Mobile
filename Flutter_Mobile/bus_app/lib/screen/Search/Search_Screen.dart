

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlong2/latlong.dart';

import '../../Views/Map/searchMap/search_map.dart';
import '../../data/web_server/connect_app_api.dart';
import 'package:http/http.dart' as http;

import '../../shared/styles/log_app.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  LogApp logApp = LogApp();
  bool isTableVisible = false;
  bool isInputEnable=true;
  late WebServices webServices;
  late LatLng liveLocation;
  String distanceAndTime = '';
  //List<LatLng> routeCoordinates = [];



  String nearestStation = '';
  double nearestStationLatitude = 0.0;
  double nearestStationLongitude = 0.0;
  List<String> routeNumbers = [];
  List<Map<String, dynamic>> stationData = [];

  TextEditingController inputData = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> searchStations() async {
    try {
      // Reset the distanceAndTime variable
      distanceAndTime = '';
      final stationName = inputData.text.trim().toLowerCase(); // تحويل النص إلى أحرف صغيرة
      final response = await http.get(
        Uri.parse(
            'http://192.168.1.5:8000/guide/find_station?station_name=$stationName&latitude=${liveLocation.latitude}&longitude=${liveLocation.longitude}'),
      );

      if (response.statusCode == 200){
        final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        stationData = responseData.map((data) {
          return {
            'route_number': data['Route Number'],
            'nearest_station': data['Nearest Station'],
            'nearest_station_latitude': data['Nearest Station Latitude'],
            'nearest_station_longitude': data['Nearest Station Longitude'],
          };
        }).toList();
        isTableVisible = true; // Show the table when data is fetched
        isInputEnable = false;
      });

    }
      // Fetch the route for each station after updating the nearest station information
      for (int i = 0; i < stationData.length; i++) {
        await fetchRoute(i);
      }// Fetch the route after updating the nearest station information
    } catch (e) {
      _showSnackBar("الرجاء التاكد من ادخال البيانات صحيحة");
    }
  }


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _checkPermissionsAndGetLocation() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      _showSnackBar("GPS مغلق. يرجى تفعيله.");
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        liveLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      _showSnackBar("حدث خطأ في الحصول على الموقع.");
    }
  }

  Future<void> _checkGpsAndProceed() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      bool gpsEnabled = false;
      while (!gpsEnabled) {
        _showSnackBar("GPS مغلق. يرجى تفعيله.");
        await Future.delayed(const Duration(seconds: 5));
        gpsEnabled = await Geolocator.isLocationServiceEnabled();
      }
    }

    await _checkPermissionsAndGetLocation();
    await searchStations();


  }
  Future<void> fetchRoute(int index) async {
    final response = await http.get(
      Uri.parse(
        'http://router.project-osrm.org/route/v1/walking/${liveLocation.longitude},${liveLocation.latitude};${stationData[index]['nearest_station_latitude']},${ stationData[index]['nearest_station_longitude']}?overview=full&geometries=geojson',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        // Reset the distanceAndTime variable before updating it
        distanceAndTime = '';
        final duration = data['routes'][0]['duration'] / 60;
        stationData[index]['distanceAndTime'] = "${duration.toStringAsFixed(2)} دقائق";

      });


    } else {
      _showSnackBar("Error fetching route.");
    }
  }



  @override
  void initState() {
    super.initState();
    webServices = WebServices();
    _checkPermissionsAndGetLocation();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(image: logApp.searchImage()),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: inputData,
                        enabled: isInputEnable,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.yellow, // Default border color
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xFF0057FF), // Color when the TextFormField is enabled
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color(0xFF0057FF), // Color when the TextFormField is focused
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.red, // Color when there's an error
                              width: 2.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.red, // Color when the TextFormField is focused and there's an error
                              width: 2.0,
                            ),
                          ),
                          labelText: "منطقة",
                          labelStyle: TextStyle(color: Color(0xFF0057FF)),
                          prefixIcon: Icon(Icons.bus_alert_outlined, color: Colors.blue),
                        ),
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "الرجاء إدخال البيانات بشكل صحيح";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  child: const Text("بحث"),
                  onPressed: () async {
                    await _checkGpsAndProceed();
                  },
                ),
              ),
              if (isTableVisible)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      DataTable(
                        headingRowColor: MaterialStateProperty.all(Colors.blue),
                        columns: const [
                          DataColumn(
                            label: Text(
                              "رقم الاتوبيس",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "اقرب محطة",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "المدة",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "عرض المسار",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          stationData.length,
                              (index) => DataRow(
                            color: MaterialStateProperty.all(Colors.white),
                            cells: [
                              DataCell(Text(stationData[index]['route_number'].toString())),
                              DataCell(Text(stationData[index]['nearest_station'].toString())),
                              DataCell(Text(stationData[index]['distanceAndTime'].toString())),
                              DataCell(
                                const Text("اضغط هنا"),
                                onTap:() {
                                      Navigator.push(
                                               context,
                                        MaterialPageRoute(
                                        builder: (context) {
                                               return SearchMap(
                                                  fixedBluePoint: LatLng(
                                                    stationData[index]['nearest_station_latitude'],
                                                    stationData[index]['nearest_station_longitude'],
                                                                           ),
                                                                                );
                                                                                      },
                                                                                                ),
                                                                                                    );
                                                                                                               },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isTableVisible = false; // إخفاء الجدول
                            isInputEnable = true;
                            distanceAndTime="";
                            inputData.clear();// تنظيف نص المدخلات
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("اغلاق"),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }




}
