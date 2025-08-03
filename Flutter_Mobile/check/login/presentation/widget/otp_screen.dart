import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/widgets/custom_opt_input.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import 'login_screen.dart';

class OtpScreen extends StatelessWidget {


  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 44.h,
              width: 44.h,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34.r),
                    bottomRight: Radius.circular(34.r),
                    topLeft: Radius.circular(34.r),
                    topRight: Radius.circular(34.r),
                  ),
                  border: Border.all(color: Color(0xffEAEAEA), width: 1.w)),
              child: Icon(Icons.arrow_back)),
        ),
        title: CustomText(
        text: "OTP",
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w,),
          child: Column(
            children: [
              SizedBox(
                height: 44.h,
              ),
              SvgPicture.asset(
                AppImage.logoOtp,
                height: 243.h,
                width: 243.w,
              ),
              Text(
                "Verification code",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: AppColor.fontColor,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              CustomText(
                text: "We have sent the code verification to you ",
                fontSize: 14.sp,
                color: AppColor.subFontColor,
                fontWeight: FontWeight.w400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "WhatsApp Number",
                    fontSize: 14.sp,
                    color: AppColor.subFontColor,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: "+62812 788 6XXXX",
                    fontWeight: FontWeight.w400,
                    color: AppColor.fontColor,
                    fontSize: 14.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              CustomPinPut(),
              SizedBox(
                height: 24.h,
              ),
              CustomText(
                  text: "Recent code in 32s",
                  fontSize: 16.sp,
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: 71.h,
              ),
              CustomTextButton(
                label: "Continue",
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return  BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: CustomSuccessOtp());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSuccessOtp extends StatelessWidget {
  const CustomSuccessOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 517.h,
      width: 375.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 66.66666.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColor.subFontColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11.r),
                topLeft: Radius.circular(11.r),
                bottomRight: Radius.circular(11.r),
                topRight: Radius.circular(11.r),
              ),
            ),
          ),
          SizedBox(height:14 .h,),
          SvgPicture.asset(AppImage.logoSuccess,width: 243.h,height: 243.h,),
          SizedBox(height: 24.h,),
          CustomText(text: "Congratulations!",
              fontSize:24.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600),
          SizedBox(height: 12.h,),
          CustomText(text: "Your account is ready to use. You will be redirected \n                    to the Homepage in a few seconds.",
              fontSize:12.sp,
              color: AppColor.subFontColor,
              fontWeight: FontWeight.w400),
          SizedBox(height: 24.h,),
          GestureDetector(onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => LoginScreen(), ), (route) => false);
          },
              child: CustomTextButton(label: "Continue",)),

        ],
      ),
    );
  }
}


