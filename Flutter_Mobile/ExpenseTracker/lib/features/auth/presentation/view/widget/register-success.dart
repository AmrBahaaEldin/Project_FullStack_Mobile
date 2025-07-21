import 'package:expensetracker/core/constant/image_app.dart';
import 'package:expensetracker/core/constant/router_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RegisterSuccess extends StatefulWidget {
  const RegisterSuccess({super.key});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  void initState() {
    nextPage();
    super.initState();
  }

  Future<void> nextPage() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return; //
      GoRouter.of(context).push(RouterApp.home);
    });
  }

  // void initState() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageApp.successSV,
              height: 96.h,
              width: 96.w,
            ),
            SizedBox(height: 16.h),
            const Text(
              "your are Set!",
              style: AppTextStyles.textStyle24,
            )
          ],
        ),
      )),
    );
  }
}
