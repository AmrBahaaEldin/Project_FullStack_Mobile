import 'package:basicrestaurant/core/constant/router_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const BasicRestaurant());
}

class BasicRestaurant extends StatelessWidget {
  const BasicRestaurant({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) =>MaterialApp.router(
        routerConfig: RouterApp.router,
        debugShowCheckedModeBanner: false,

      ) ,

    );
  }
}

