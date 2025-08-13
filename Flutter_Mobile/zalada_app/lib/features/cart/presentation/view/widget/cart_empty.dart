import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/image_app.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 44.h),
        Image.asset(ImageApp.cartEmpty),
        SizedBox(height: 24.h),
        const Text("Your cart is an empty!", style: StylesTextApp.textStyle24),
        SizedBox(height: 12.h),
        Text(
          "Looks like you haven't added anything \nto your cart yet",
          style: StylesTextApp.textStyle14.copyWith(color: ColorApp.dark25),
        ),
        SizedBox(height: 82.h),
      ],
    );
  }
}
