import 'package:flutter/material.dart';

class ProfileSettingsModel {
  String title;
  Icon iconLeading;
  Icon iconTrailing;
  Color? color;
  void Function() onPressed;
  ProfileSettingsModel({
    required this.title,
    required this.iconLeading,
    required this.onPressed,
    required this.iconTrailing,
    this.color,
  });
}
