import 'package:expensetracker/core/constant/router_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/core/widgets/custom_button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SetupAccount extends StatelessWidget {
  const SetupAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 67.h, right: 16.w, left: 16.w, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's setup your\naccount!",
                style: AppTextStyles.textStyle32,
              ),
              SizedBox(height: 37.h),
              const Text(
                "Account can be your bank, credit card or \nyour wallet.",
                style: AppTextStyles.textStyle14,
              ),
              const Spacer(),
              CustomButtonApp(
                text: "Let's go",
                onPressed: () {
                  GoRouter.of(context).push(RouterApp.addNewAccount);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
