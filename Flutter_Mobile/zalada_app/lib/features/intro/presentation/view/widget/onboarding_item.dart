import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/intro/data/model/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({required this.onBoardingModel, super.key});
  final OnboardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 250.h, child: SvgPicture.asset(onBoardingModel.image)),
        SizedBox(height: 40.h),
        Text(onBoardingModel.title, style: StylesTextApp.textStyle32),
        SizedBox(height: 16.h),
        Text(
          onBoardingModel.subTitle,
          style: StylesTextApp.textStyle16.copyWith(color: ColorApp.dark25),
        ),
      ],
    );
  }
}
