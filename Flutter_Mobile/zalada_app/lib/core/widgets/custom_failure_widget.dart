import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: StylesTextApp.textStyle32.copyWith(color: ColorApp.red100),
      ),
    );
  }
}
