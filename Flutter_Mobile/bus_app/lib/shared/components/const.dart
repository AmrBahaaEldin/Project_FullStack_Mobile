import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';


import '../../Views/Map/DriverMap/driver_map.dart';
import '../../Views/Map/UserMap/user_map.dart';
import 'components.dart';

class ImportComponents{
  void messageLoginError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("خطأ"),
          content: const Text("برجاء إدخال حساب  وكلمة مرور صحيحة."),
          actions: [
            TextButton(
              onPressed: () {
                navigateBack(context,true); // أغلق الحوار
              },
              child: const Text("موافق"),
            ),
          ],
        );
      },
    );
  }
  void messagePublicError(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("خطأ"),
          content: const Text("برجاء إدخال بيانات صحيحة."),
          actions: [
            TextButton(
              onPressed: () {
                navigateBack(context,true); // أغلق الحوار
              },
              child: const Text("موافق"),
            ),
          ],
        );
      },
    );
  }
  ////////////////////////////////////////////////////////////////////////////////////////////
  FloatingActionButton leavePage(BuildContext context,Widget homePage,Widget loginPage) {
    return FloatingActionButton(
        onPressed: () {
          showDialog(context: context,
            builder: (context) => AlertDialog(
              title: const Text("للخروج من الصفحة"),
              actions: [
                Row(
                  children: [
                    Column(
                      children: [
                        IconButton(onPressed: () {
                          navigateStop(context,homePage);
                        },
                            icon: const Icon(Icons.home)),
                        const Text("صفحة رئيسية")
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        IconButton(onPressed: () {
                          navigateStop(context,loginPage);
                        },
                            icon:const Icon(Icons.logout) ),
                        const Text("صفحة التسجيل")
                      ],
                    ),
                  ],
                )
              ],
            ),);
        },child: const Icon(Icons.door_back_door_outlined)

    );
  }
/////////////////////////////////////////////////////////////////////////////////////////////

  // Widget afterGetBarCode(BuildContext context) {
  //  return MaterialButton(
  //     color: Colors.blue,
  //     shape: OutlineInputBorder(
  //       borderSide: const BorderSide(color: Colors.white),
  //       borderRadius: BorderRadius.circular(50),
  //
  //     ),
  //
  //
  //     child: const Text( "عرض مسار العمل"),
  //
  //     onPressed:  () async {
  //       navigateTo(context,const DriverMap(fixedMarkers: [
  //         LatLng(29.993228591871922, 31.312598656897627),  // مثال: مبنى إمباير ستيت
  //         LatLng(29.982048263044135, 31.34711808698053),  // مثال: تمثال الحرية
  //         LatLng(29.976922650709948, 31.349119534633264),  // مثال: ميدان التايمز
  //         LatLng(29.980926771921478, 31.314127038985955),  // مثال: مانهاتن
  //         LatLng(29.95966078496634, 31.258560398395222),  // مثال: بروكلين
  //         LatLng(29.998878868035085, 31.207448224703036),  // مثال: جسر بروكلين
  //         LatLng(30.024121114614594, 31.276262228674128),  // مثال: سنترال بارك
  //       ]
  //       )
  //       );
  //     },);
  //
  // }
///////////////////////////////////////////////////////////////////////////////////////
  Row closeArrow(BuildContext context,Widget screen1,Widget screen2) {
    return Row(
      children: [
        Column(
          children: [
            IconButton(onPressed: () {
              navigateStop(context,  screen1);
            },
                icon: const Icon(Icons.home)),
            const Text("صفحة رئيسية")
          ],
        ),
        const Spacer(),
        Column(
          children: [
            IconButton(onPressed: () {
              navigateStop(context, screen2);
            },
                icon:const Icon(Icons.logout) ),
            const Text("صفحة التسجيل")
          ],
        ),
      ],
    );
  }

}