import 'package:basicrestaurant/core/constant/color_app.dart';
import 'package:basicrestaurant/core/constant/style_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EasyTextField extends StatelessWidget {
  const EasyTextField({
    super.key,
    required this.text,
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
      style: AppTextStyles.textStyle16.copyWith(color: AppColor.accent30),
      cursorColor: AppColor.accent10,
      scrollPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hint: Text(
          text,
          style: AppTextStyles.textStyle16.copyWith(
            color: colorHint ?? AppColor.accent30,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.accent90,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.accent10,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(
            16.r,
          ),
        ),
      ),
    );
  }
}
