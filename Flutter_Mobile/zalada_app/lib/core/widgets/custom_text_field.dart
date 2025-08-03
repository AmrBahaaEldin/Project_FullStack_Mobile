
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class EasyTextField extends StatelessWidget {
  const EasyTextField({
    required this.text,
    super.key,

    this.keyboardType,
    this.controller,
    this.isreadOnly = false,
    this.isPassword = false,
    this.onPressed,
    this.suffixIcon,
    this.colorHint,
  });
  final String text;

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isPassword;
  final void Function()? onPressed;
  final Widget? suffixIcon;
  final Color? colorHint;
  final bool isreadOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: isPassword,
      readOnly: isreadOnly,
      onTap: onPressed,
      style: StylesTextApp.textStyle16.copyWith(color: ColorApp.dark75),
      cursorColor: ColorApp.violet40,
      scrollPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hint: Text(
          text,
          style: StylesTextApp.textStyle16.copyWith(
            color: colorHint ?? ColorApp.violet40,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.violet100, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.violet60, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
