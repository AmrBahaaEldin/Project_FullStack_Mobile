import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/router_app.dart';
import 'package:expensetracker/features/onboarding/data/models/data_slider_model.dart';
import 'package:expensetracker/features/onboarding/presentation/widget/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button_app.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  double _currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 12.w),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: DataSliderModel.dataSlider.length,
            itemBuilder: (context, index, realIndex) {
              final slider = DataSliderModel.dataSlider[index];
              return SliderWidget(
                  image: slider.image,
                  titleText: slider.titleText,
                  descriptionText: slider.descriptionText);
            },
            carouselController: _carouselController,
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayCurve: Curves.easeInOutQuad,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPosition = index.toDouble();
                });
              },
              height: 548.h,
              viewportFraction: 1,
            ),
          ),
          DotsIndicator(
            position: _currentPosition,
            onTap: (position) {
              setState(() {
                _currentPosition = position.toDouble();
                _carouselController.animateToPage(
                  position.toInt(),
                  curve: Curves.easeInOutCubic,
                  duration: const Duration(
                    seconds: 3,
                  ),
                );
              });
            },
            dotsCount: 3,
            decorator: const DotsDecorator(
              sizes: [
                Size.square(15.0),
                Size.square(15.0),
                Size.square(15.0),
              ],
              color: ColorApp.dark25,
              activeSizes: [
                Size.square(25.0),
                Size.square(25.0),
                Size.square(25.0),
              ],
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RouterApp.register);
            },
            child: const CustomButtonApp(
              text: "Sign Up",
            ),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(RouterApp.login);
            },
            child: const CustomButtonApp(
              text: "Login",
              boxColor: ColorApp.violet20,
              textColor: ColorApp.violet100,
            ),
          ),
        ],
      ),
    );
  }
}
