import 'package:expensetracker/core/constant/font_app.dart';
import 'package:flutter/material.dart';

//(lineHeight ÷ fontSize)

class AppTextStyles {
  AppTextStyles._();

  // Titles
  static const TextStyle textStyle64 = TextStyle(
    fontSize: 64,
    height: 80 / 64, // Line height = 80
    fontWeight: FontWeight.bold,
    fontFamily: FontsApp.inter,
  );

  static const TextStyle textStyle32 = TextStyle(
    fontSize: 32,
    height: 34 / 32,
    fontWeight: FontWeight.bold,
    fontFamily: FontsApp.inter,
  );

  static const TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    height: 22 / 24,
    fontWeight: FontWeight.w600,
    fontFamily: FontsApp.inter,
  );

  static const TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    height: 22 / 18,
    fontWeight: FontWeight.w600,
    fontFamily: FontsApp.inter,
  );

  // Regular
  static const TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    height: 19 / 16,
    fontWeight: FontWeight.normal,
    fontFamily: FontsApp.inter,
  );

  static const TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    height: 18 / 14,
    fontWeight: FontWeight.w400,
    fontFamily: FontsApp.inter,
  );

  // Small
  static const TextStyle textStyle13 = TextStyle(
    fontSize: 13,
    height: 16 / 13,
    fontWeight: FontWeight.w400,
    fontFamily: FontsApp.inter,
  );

  // Tiny
  static const TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    height: 1, // 12 / 12 = 1
    fontWeight: FontWeight.w400,
    fontFamily: FontsApp.inter,
  );
}
