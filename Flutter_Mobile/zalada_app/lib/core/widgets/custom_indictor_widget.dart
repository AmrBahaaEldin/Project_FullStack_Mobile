import 'package:flutter/material.dart';

class CustomIndicatorWidget extends StatelessWidget {
  const CustomIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Align(
          alignment: Alignment.center, child: CircularProgressIndicator()),
    );
  }
}
