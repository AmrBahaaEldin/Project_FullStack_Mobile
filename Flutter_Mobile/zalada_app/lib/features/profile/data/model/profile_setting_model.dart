import 'package:flutter/material.dart';

class ProfileSettingsModel {
  String title;
  Icon iconLeading;
  dynamic iconTrailing;
  Color? color;

  ProfileSettingsModel({
    required this.title,
    required this.iconLeading,

    required this.iconTrailing,
    this.color,
  });
}
