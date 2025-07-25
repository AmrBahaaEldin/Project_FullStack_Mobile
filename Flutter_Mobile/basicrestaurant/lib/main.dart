//import 'package:basicrestaurant/core/constant/router_app.dart';
import 'package:basicrestaurant/firebase_options.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/bloc_observer.dart';
import 'features/auth/login/presentation/view/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  fireBaseInitial();

  runApp(const BasicRestaurant());
}

Future<void> fireBaseInitial() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class BasicRestaurant extends StatelessWidget {
  const BasicRestaurant({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(823, 411),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),

      //     MaterialApp.router(
      //   routerConfig: RouterApp.router,
      //   debugShowCheckedModeBanner: false,
      //
      // ) ,
    );
  }
}
