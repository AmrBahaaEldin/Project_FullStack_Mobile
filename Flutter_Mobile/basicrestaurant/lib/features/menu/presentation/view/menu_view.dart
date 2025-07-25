import 'package:basicrestaurant/core/constant/style_app.dart';
import 'package:basicrestaurant/features/menu/presentation/view/widget/menu_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Hi,Amr", style: AppTextStyle.textStyle24),
            SizedBox(height: 4.h),
            const Text(
              "Get your favorite food here!",
              style: AppTextStyle.textStyle16,
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: const MenuBody(),
    );
  }
}
