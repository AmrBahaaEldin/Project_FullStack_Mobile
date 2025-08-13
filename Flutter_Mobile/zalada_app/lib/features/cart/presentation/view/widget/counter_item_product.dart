import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/color_app.dart';

class CounterItemProduct extends StatelessWidget {
  const CounterItemProduct({super.key, this.icon});
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(
        shape: WidgetStatePropertyAll(
          OvalBorder(side: BorderSide(color: ColorApp.dark25)),
        ),
      ),
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}
