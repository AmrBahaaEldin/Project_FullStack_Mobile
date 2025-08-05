import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/utils/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  // Initialize service locator
  runApp(const ZaladaApp());
}

class ZaladaApp extends StatelessWidget {
  const ZaladaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      splitScreenMode: false,
      builder: (context, child) => MaterialApp.router(
        routerConfig: RouterApp.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
