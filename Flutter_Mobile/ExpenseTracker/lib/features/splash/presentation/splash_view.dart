import 'package:expensetracker/core/constant/color_app.dart';
import 'package:flutter/material.dart';

import 'widget/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold
    (
        backgroundColor: ColorApp.violet100,
        body: SplashBody(),
    );
  }
}