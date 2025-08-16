import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/color_app.dart';

class CounterItemProduct extends StatelessWidget {
  const CounterItemProduct({this.onPressed, super.key, this.icon});
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: const ButtonStyle(
        shape: WidgetStatePropertyAll(
          OvalBorder(side: BorderSide(color: ColorApp.dark25)),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
