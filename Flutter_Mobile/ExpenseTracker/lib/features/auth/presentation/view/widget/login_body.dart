import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/router_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/core/widgets/custom_button_app.dart';
import 'package:expensetracker/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 72.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          const EasyTextField(
            text: "Email",
          ),
          SizedBox(height: 24.h),
          const EasyTextField(
            suffixIcon: Icon(
              Icons.visibility_outlined,
              color: ColorApp.light20,
            ),
            text: "Password",
          ),
          SizedBox(height: 40.h),
          CustomButtonApp(
            text: "Login",
            onPressed: () => GoRouter.of(context).push(RouterApp.setupAccount),
          ),
          SizedBox(height: 33.h),
          Text(
            "Forgot Password?",
            style: AppTextStyles.textStyle18.copyWith(
              color: ColorApp.violet100,
            ),
          ),
          SizedBox(height: 38.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Don’t have an account yet? ",
              style: AppTextStyles.textStyle16.copyWith(
                color: ColorApp.dark25,
              ),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: AppTextStyles.textStyle16.copyWith(
                    color: ColorApp.violet100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
