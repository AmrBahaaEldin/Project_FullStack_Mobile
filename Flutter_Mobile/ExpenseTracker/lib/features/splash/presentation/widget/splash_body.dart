import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/image_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/router_app.dart';
import '../../../../core/constant/style_app.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliderAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    routerToHome();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SlideTransition(position:sliderAnimation,
        child: Text("My", style: AppTextStyles.textStyle64.copyWith(
          color: ColorApp.light100,),),),
        SizedBox(width: 5.w,),
        SlideTransition(
          position: sliderAnimation,
          child: Text(
              "Money",
              style: AppTextStyles.textStyle64.copyWith(
                  color: ColorApp.light100)),
        ),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    sliderAnimation = Tween<Offset>(
      begin: const Offset(4, 12),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
    animationController.forward();
  }

  Future<void> routerToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
     GoRouter.of(context).push(RouterApp.onBoarding);
  }
}
