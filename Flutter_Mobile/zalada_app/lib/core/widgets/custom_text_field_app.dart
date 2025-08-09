import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class CustomTextFieldApp extends StatelessWidget {
  const CustomTextFieldApp({
    required this.colorEnableBorder,
    required this.colorFocusedBorder,
    this.validator,
    super.key,
    this.textHint,
    this.keyboardType,
    this.controller,
    this.isReadOnly = false,
    this.notShowPassword = false,
    this.onPressed,
    this.suffixIcon,
    this.colorHint,
    this.labelText,
  });
  final String? textHint;
  final String? Function(String?)? validator;
  final Color colorFocusedBorder;
  final Color colorEnableBorder;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool notShowPassword;
  final void Function()? onPressed;
  final Widget? suffixIcon;
  final Color? colorHint;
  final bool isReadOnly;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      obscureText: notShowPassword,
      readOnly: isReadOnly,
      onTap: onPressed,
      validator: validator,
      style: StylesTextApp.textStyle16.copyWith(color: ColorApp.dark75),
      cursorColor: ColorApp.violet40,
      scrollPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        hint: Text(
          textHint ?? "",
          style: StylesTextApp.textStyle16.copyWith(
            color: colorHint ?? ColorApp.violet40,
          ),
        ),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorFocusedBorder, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorEnableBorder, width: 1.w),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
