import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/style_app.dart';

class EasyButtonApp extends StatelessWidget {
  const EasyButtonApp({
    super.key,
    required this.text,
    this.textColor,
    this.boxColor,

    this.onPressed,
    required this.height,
  });

  final String text;
  final Color? textColor;
  final Color? boxColor;

  final double height;
  final void Function()?
  onPressed; // Assuming this is a flag for some condition

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.textStyle16.copyWith(color: textColor),
          ),
          backgroundColor: WidgetStatePropertyAll(boxColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
        onPressed: onPressed,

        child: Text(
          text,
          style: AppTextStyle.textStyle16.copyWith(color: textColor),
        ),
      ),
    );
  }
}
