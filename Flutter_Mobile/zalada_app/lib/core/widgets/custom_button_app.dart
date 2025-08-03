import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zalada_app/core/constant/image_app.dart';
import '../constant/color_app.dart';
import '../constant/style_app.dart';

class CustomButtonApp extends StatelessWidget {
  const CustomButtonApp({
    required this.text,
    super.key,
    this.textColor,
    this.boxColor,
    this.isTwins = false,
    this.onPressed,
  });

  final String text;
  final Color? textColor;
  final Color? boxColor;
  final bool isTwins;
  final void Function()?
  onPressed; // Assuming this is a flag for some condition

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 56.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: boxColor ?? ColorApp.violet100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: isTwins
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isTwins ? SvgPicture.asset(ImageApp.googleSV) : const Text(""),
                SizedBox(width: 10.w),
                Text(
                  text,
                  style: StylesTextApp.textStyle18.copyWith(
                    color: textColor ?? ColorApp.light80,
                  ),
                ),
              ],
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: StylesTextApp.textStyle18.copyWith(
                  color: textColor ?? ColorApp.light80,
                ),
              ),
            ),
    );
  }
}
