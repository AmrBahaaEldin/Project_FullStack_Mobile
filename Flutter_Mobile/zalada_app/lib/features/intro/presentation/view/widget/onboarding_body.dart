import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/features/intro/data/model/onboarding_data.dart';
import 'package:zalada_app/features/intro/presentation/view/widget/onboarding_item.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  double percent = .33;
  int currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.h),
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            options: CarouselOptions(
              initialPage: currentIndex,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },

              enableInfiniteScroll: false,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              height: 480.h,
              autoPlay: false,
              viewportFraction: 1.0,
            ),
            itemCount: OnboardingData.onboardingData.length,
            itemBuilder: (context, index, realIndex) => OnboardingItem(
              onBoardingModel: OnboardingData.onboardingData[index],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 60.r,
                  lineWidth: 2,
                  percent: percent,
                  progressColor: ColorApp.blue100,
                  backgroundColor: ColorApp.light100,
                  circularStrokeCap: CircularStrokeCap.square,
                ),
                Container(
                  height: 62.h,
                  width: 62.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(84.r),
                    color: ColorApp.blue100,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (currentIndex <
                          OnboardingData.onboardingData.length - 1) {
                        _controller.nextPage();
                        percent += 0.334;
                      } else {
                        percent = 0.33;
                        currentIndex = 0;
                        _controller.jumpToPage(0);
                      }
                    },

                    icon: const Icon(
                      Icons.arrow_forward,
                      color: ColorApp.light100,
                    ),
                    iconSize: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
