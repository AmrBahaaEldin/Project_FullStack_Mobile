import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../layout/Home_Screen/home_screen.dart';
import '../../shared/styles/log_app.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {
  late AnimationController imageAnimationController;
   late AnimationController textAnimationController;
   late AnimationController textTwoAnimationController;
  IconApp iconApp = IconApp();

  late Animation<double> imageAnimation;
  late Animation<double> textAnimation;
  late Animation<double> textTwoAnimation;


  @override
  void initState() {
    super.initState();

    // شرح باقي خصائص AnimationController و Tween هنا ...

    // التحقق من الاتصال بالإنترنت عند بدء التطبيق

    imageAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    textAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    textTwoAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    imageAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: imageAnimationController, curve: Curves.easeInOutCubic));
    textAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: textAnimationController, curve: Curves.easeInExpo));
    textTwoAnimation = Tween<double>(begin: 2.0, end: 0.0).animate(
        CurvedAnimation(parent: textTwoAnimationController, curve: Curves.easeInCirc));

    imageAnimationController.forward();
    textAnimationController.forward();
    textTwoAnimationController.forward();
    checkInternetConnection();

  }

  // تحقق من الاتصال بالإنترنت
  void checkInternetConnection() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      _showNoInternetDialog();
    } else if(connectivityResult.contains(ConnectivityResult.mobile)|| connectivityResult.contains(ConnectivityResult.wifi)) {
      _navigateToHomeScreen();
    }

  }

  // إظهار نافذة منبثقة إذا لم يكن هناك اتصال بالإنترنت
  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("فشل في الاتصال"),
          content: const Text("يرجى التحقق من إعدادات الاتصال بالإنترنت لديك"),
          actions: <Widget>[
            TextButton(
              child: const Text("تم"),
              onPressed: () async {
                Navigator.of(context).pop(); // إغلاق النافذة المنبثقة
                checkInternetConnection(); // إعادة التحقق من الاتصال
              },
            ),
          ],
        );
      },
    );
  }

  // التنقل إلى HomeScreen
  void _navigateToHomeScreen() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
  }

  @override
  void dispose() {
    imageAnimationController.dispose();
    textAnimationController.dispose();
    textTwoAnimationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF0057FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: imageAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(imageAnimation.value * screenWidth, 0),
                  child: child,
                );
              },
              child:
                CircleAvatar(

                  backgroundColor: Colors.white,
                radius: 50,

                  child:Image(image: iconApp.loadingImage(),width: 70) ,
                )
              // Image.asset(
              //   'asset/image/bus_log.png', // تصحيح مسار الصورة هنا
              //   width: 100,
              //   height: 100,
              // ),
            ),

            AnimatedBuilder(
              animation: textAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(textAnimation.value * screenWidth, 0),
                  child: child,
                );
              },
              child: const Text('CTA Bus', style: TextStyle(fontSize: 24,color:Colors.white)),
            ),
            AnimatedBuilder(
              animation: textTwoAnimationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, textTwoAnimation.value * screenWidth),
                  child: child,
                );
              },
              child: const Text('مرحبا بيكم', style: TextStyle(fontSize: 25,color: Colors.amber)),
            ),
          ],
        ),
      ),
    );
  }
}




