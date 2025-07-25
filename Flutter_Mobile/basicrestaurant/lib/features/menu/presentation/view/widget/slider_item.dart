import 'package:basicrestaurant/features/menu/data/model/slide_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({super.key, required this.slideModel});
  final SlideModel slideModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 32.h),
      width: 500.w,
      height: 312.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40.r)),
      child: Image.asset(slideModel.image),
    );
  }
}
