import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/color_app.dart';
import '../../../../core/constant/style_app.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.image,
    required this.titleText,
    required this.descriptionText,
  });
  final String image;
  final String titleText;
  final String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 32.h),
          width: 312.w,
          height: 312.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: SvgPicture.asset(
            image,
          ),
        ),
        SizedBox(
          height: 41.h,
        ),
        Text(
          textAlign: TextAlign.center,
          titleText,
          style: AppTextStyles.textStyle32,
        ),
        SizedBox(
          height: 17.h,
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            descriptionText,
            style: AppTextStyles.textStyle16.copyWith(
              color: ColorApp.light20,
            ),
          ),
        ),
      ],
    );
  }
}
