import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/core/widgets/custom_button_app.dart';
import 'package:expensetracker/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 68.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          const EasyTextField(
            text: "Name",
          ),
          SizedBox(height: 24.h),
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
          SizedBox(height: 17.h),
          Row(
            children: [
              Checkbox(
                checkColor: ColorApp.dark50,
                activeColor: ColorApp.violet40,
                side: BorderSide(
                  width: 2.w,
                  color: ColorApp.violet100,
                ),

                //focusColor: ColorApp.violet100,
                value: false,
                onChanged: (value) {
                  debugPrint("hola");
                },
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "By signing up, you agree to the\n",
                  style: AppTextStyles.textStyle14
                      .copyWith(color: ColorApp.dark25),
                  children: [
                    TextSpan(
                      text: "Terms of Service",
                      style: AppTextStyles.textStyle14.copyWith(
                        color: ColorApp.violet100,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: AppTextStyles.textStyle14.copyWith(
                        color: ColorApp.dark25,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppTextStyles.textStyle14.copyWith(
                        color: ColorApp.violet100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 27.h),
          const CustomButtonApp(text: "Sign up"),
          SizedBox(height: 12.h),
          Text(
            "Or With",
            style: AppTextStyles.textStyle14.copyWith(
              color: ColorApp.light20,
            ),
          ),
          SizedBox(height: 12.h),
          const CustomButtonApp(
            text: "Sign up with Google",
            isTwins: true,
            boxColor: ColorApp.light60,
            textColor: ColorApp.dark50,
          ),
          SizedBox(height: 19.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Already have an account? ",
              style: AppTextStyles.textStyle16.copyWith(
                color: ColorApp.dark25,
              ),
              children: [
                TextSpan(
                  text: "Login",
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
