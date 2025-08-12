import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/color_app.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: ColorApp.blue80),
    );
  }
}
