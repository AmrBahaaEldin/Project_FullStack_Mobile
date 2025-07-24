import 'package:basicrestaurant/core/constant/color_app.dart';
import 'package:basicrestaurant/features/splash/presentation/view/widget/splash_body.dart';
import 'package:flutter/material.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      backgroundColor: AppColor.primary50,
      body:SplashBody(),
    );
  }
}

