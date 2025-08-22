
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../Views/Map/DriverMap/driver_map.dart';
import '../../data/web_server/connect_app_api.dart';
import '../../shared/components/components.dart';
import '../../shared/components/const.dart';
import '../../shared/styles/log_app.dart';

class DriverScreen extends StatefulWidget {

  final String nameDriver;
  final String routeNumberDriver;
  final String plateNumberDriver;
  final VoidCallback updateData;

  const DriverScreen({
    Key? key,  required this.nameDriver,
    required this.routeNumberDriver,
    required this.plateNumberDriver,
    required this.updateData,}) : super(key: key);




  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  late WebServices webServices;
  late LatLng liveLocation;
  List<LatLng> stationLocations = [];
  TextEditingController barCodeController = TextEditingController();
  late String code="فارغ";
  bool hasError = false;
  final ImportComponents importComponents=ImportComponents();
  final IconApp iconApp=IconApp();
  final LogApp logApp=LogApp();



  // Future<String> barCodeDriver() async{
  //   String codeBar= await FlutterBarcodeScanner.scanBarcode(
  //       "",
  //       "اغلاق",
  //       true,
  //       ScanMode.BARCODE
  //
  //   );
  //   return  codeBar;
  // }

  Future<void> fetchStations() async {
    try {
      final response = await webServices.getRouteNumber(routeNumber: int.parse(barCodeController.text), userLiveLocation: liveLocation);

      setState(() {
        stationLocations = (response['stations'] as List).map((station) {
          return LatLng(double.parse(station['latitude']), double.parse(station['longitude']));
        }).toList();
        hasError = false; // إعادة تعيين حالة الخطأ
      });
    } catch (e) {
      if (e.toString().contains('404')) {
        _showSnackBar("خطأ: رقم الطريق غير موجود.");
        // تحديث الواجهة لعرض الرسالة وإخفاء الزر
        setState(() {
          hasError = true;
        });
      } else {
        _showSnackBar("خطأ في جلب المحطات: $e");
      }
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

    // code = await //barCodeDriver();
    // setState(() {
    //   barCodeController.text = code;
    // });

   // await fetchStations();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    barCodeController.text=code;
    webServices=WebServices();
    _checkPermissionsAndGetLocation();

  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;
     return Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         Image(image:logApp.driverImageHome(),width: screenWidth * 0.8),
         const SizedBox(height: 40,),


         Column(

           crossAxisAlignment: CrossAxisAlignment.center,

           children: [
             Container(
               padding: const EdgeInsets.all(20),
               width: 300,
               decoration: const BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)),
                 color: Colors.blue,
               ),
               child: Column(
                 children: [
                   const Text("جاهز للعمل يلا",style:TextStyle(color: Colors.white)),
                   const SizedBox(height: 10),
                   Row(crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text("سائق: ",style:TextStyle(color: Colors.white),),
                       const SizedBox(width: 10),
                       Text(widget.nameDriver,style:const TextStyle(color: Colors.white),),
                   ],),
                   const SizedBox(height: 20),
                    Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                       const Text("رقم الاتوبيس :",style: TextStyle(color: Colors.white),),
                       const SizedBox(width: 10),
                       Text(widget.routeNumberDriver,style: const TextStyle(color: Colors.white),),

                     ],
                   ),
                   const SizedBox(height: 20),
                    Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text("رقم اللوحة :",style: TextStyle(color: Colors.white),),
                       const SizedBox(width: 10),
                       Text(widget.plateNumberDriver,style: const TextStyle(color: Colors.white)),


                     ],
                   ),
                   const SizedBox(height: 20),
                   const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("موعد العمل :", style: TextStyle(color: Colors.white)),
                       SizedBox(width: 10),
                       Text("صباحي", style: TextStyle(color: Colors.white)),
                     ],
                   ),
                   const SizedBox(height: 20),
                   const Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("ملاحظات:", style: TextStyle(color: Colors.white)),
                       SizedBox(width: 10),
                       Flexible(
                         child: Text(
                           "حافظ علي هدوءك في الطريق_عدم الشجار في الطريق",
                           style: TextStyle(color: Colors.white),
                           overflow: TextOverflow.ellipsis,
                           maxLines: 2,
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),

             MaterialButton(
               color: Colors.blue,
               shape: OutlineInputBorder(
                 borderSide: const BorderSide(color: Colors.white),
                   borderRadius: BorderRadius.circular(50),

               ),


               child: const Text( "بداية العمل "),

               onPressed:  () async {


                 await _checkGpsAndProceed();
                 await fetchStations();
                 },

             ),


             const SizedBox(height: 10),


             Padding(
               padding:  EdgeInsets.all(screenWidth * 0.1),
               child: TextFormField(


                 inputFormatters: [FilteringTextInputFormatter.digitsOnly], // للسماح بالأرقام فقط
                enabled: false,
                 controller:barCodeController ,
                 keyboardType: TextInputType.number,


                 decoration: InputDecoration(

                     labelText:"رقم الخط " ,
                     prefixIcon:Image(image:iconApp.barCodeIconImage(),width: 9,),
                     border: const OutlineInputBorder()  ) ,


               ),
             ),

    code=="فارغ"
    ?
    Container(
    color: Colors.blue,
    child: Text(
    "من فضلك اعمل مسح ضوء",
    style: TextStyle(
    color: Colors.red,
    fontSize: screenWidth * 0.05,
    fontWeight: FontWeight.bold,
    ),
    ),
    )
        : hasError
    ?
    const Text("رقم الطريق غير موجود.", style: TextStyle(color: Colors.red))
        : MaterialButton(
    color: Colors.blue,
    shape: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white),
    borderRadius: BorderRadius.circular(50),
    ),
    child: const Text("عرض مسار العمل"),
    onPressed: () async {

    navigateTo(context, DriverMap(
    stationLocations: stationLocations,
    liveLocation: liveLocation,
    ));
    },
    ),


             MaterialButton(
               shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: const BorderSide(color: Colors.white)),
               color: Colors.blue,
               onPressed: () {
                 widget.updateData();
               },
               child: const Text(" تحديث المهمة"),
             ),

           ],
         ),


       ],
     );

  }
}


