import 'package:expensetracker/features/home/presentation/view/widget/cartesian_chart.dart';
import 'package:expensetracker/features/home/presentation/view/widget/home_body.dart';
import 'package:expensetracker/features/home/presentation/view/widget/segment_button.dart';
import 'package:expensetracker/features/home/presentation/view/widget/transaction_list.dart';
import 'package:expensetracker/features/home/presentation/view/widget/type_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color_app.dart';
import '../../../../core/constant/image_app.dart';
import '../../../../core/constant/style_app.dart';
import '../../../main_navigation/presentation/view/main_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar:  AppBar(
        actionsPadding: EdgeInsets.zero,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 3),
          height: 20.r,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorApp.violet100,
              width: 1.w,
            ),
          ),
          child: const ClipOval(
            child: Image(
              image: AssetImage(ImageApp.profile),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
            ),
            const Text(
              "October",
              style: AppTextStyles.textStyle14,
            )
          ],
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: ColorApp.violet100,
            ),
          ),
        ],
      ),
      body:const HomeBody(),
    );
  }
}