
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class CustomTextFieldApp extends StatelessWidget {
  const CustomTextFieldApp({

    super.key,
    this.textHint,
    this.keyboardType,
    this.controller,
    this.isReadOnly = false,
    this.isPassword = false,
    this.onPressed,
    this.suffixIcon,
    this.colorHint, required String? Function(dynamic value) validator,
  });
  final String ?textHint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool isPassword;
  final void Function()? onPressed;
  final Widget? suffixIcon;
  final Color? colorHint;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: isPassword,
      readOnly: isReadOnly,
      onTap: onPressed,
      style: StylesTextApp.textStyle16.copyWith(color: ColorApp.dark75),
      cursorColor: ColorApp.violet40,
      scrollPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hint: Text(
          textHint??"",
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
