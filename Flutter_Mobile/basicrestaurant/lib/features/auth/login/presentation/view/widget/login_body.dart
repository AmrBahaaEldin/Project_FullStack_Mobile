import 'package:basicrestaurant/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constant/color_app.dart';
import '../../../../../../core/constant/style_app.dart';
import '../../../../../../core/widgets/custom_button_app.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40.h,
        right: 20.w,
        left: 20.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          const EasyTextField(
            text: "Email",
            label: "Email",
            colorLabel: AppColor.black,
            colorHint: AppColor.gray,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 25.h),
          const EasyTextField(
            isPassword: true,    
            suffixIcon: Icon(Icons.visibility_rounded),
            text: "password",
            label: "password",
            colorLabel: AppColor.black,
            colorHint: AppColor.gray,
            keyboardType: TextInputType.visiblePassword,
          ),
          SizedBox(height: 45.h),
          const EasyButtonApp(
            height: 45,
            text: 'Login',
            boxColor: AppColor.primary50,

            textColor: AppColor.white,
          ),
          SizedBox(height: 24.h),
          RichText(
            text: TextSpan(
              text: "Doesn't have an account?",
              style: AppTextStyle.textStyle13.copyWith(color: AppColor.black),
              children: [
                TextSpan(
                  text: " Sign Up",
                  style: AppTextStyle.textStyle16.copyWith(
                    color: AppColor.primary30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
