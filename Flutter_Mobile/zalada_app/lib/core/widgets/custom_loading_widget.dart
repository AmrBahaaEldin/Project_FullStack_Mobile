import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/image_app.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.showLoading = true});
  final bool showLoading;
  @override
  Widget build(BuildContext context) {
    return showLoading
        ? const CircularProgressIndicator(color: ColorApp.blue80)
        : Image.asset(ImageApp.loading);
  }
}
