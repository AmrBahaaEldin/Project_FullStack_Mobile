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
    this.label,
    this.isReadOnly = false,
    this.isPassword = false,
    this.onPressedTap,
    this.suffixIcon,
    this.colorHint,
    this.colorLabel,
  });
  final String text;

  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isPassword;
  final void Function()? onPressedTap;
  final Widget? suffixIcon;
  final Color? colorHint;
  final String? label;
  final bool isReadOnly;
  final Color? colorLabel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: isPassword,
      readOnly: isReadOnly,

      style: AppTextStyle.textStyle16.copyWith(color: AppColor.black),
      cursorColor: AppColor.accent10,
      scrollPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyle.textStyle18.copyWith(color: colorLabel),

        suffixIcon: suffixIcon,
        hint: Text(
          text,
          style: AppTextStyle.textStyle18.copyWith(color: colorHint),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.accent90, width: 1.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.accent90, width: 1.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}
