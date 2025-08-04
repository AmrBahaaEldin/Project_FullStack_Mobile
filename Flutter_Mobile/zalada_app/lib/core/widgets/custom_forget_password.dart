import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/features/intro/presentation/view/onboarding_view.dart';

class CustomForgetPasswordSheet extends StatelessWidget {
  const CustomForgetPasswordSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 334.h,
      width: 375.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),

          Center(
            child: Container(
              width: 66.66666.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: ColorApp.green40,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(11.r),
                  topLeft: Radius.circular(11.r),
                  bottomRight: Radius.circular(11.r),
                  topRight: Radius.circular(11.r),
                ),
              ),
            ),
          ),
          SizedBox(height: 18.h,),
          Text( "Forgot Password",style: GoogleFonts.plusJakartaSans(
            color: ColorApp.green100,
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
          )),
          SizedBox(height: 12.h,),
          Text( "Select which contact details should we use to\n reset your password",style: GoogleFonts.plusJakartaSans(

          )),
          SizedBox(height: 24.h,),
          Container(
            height: 76.h,
            width: 355.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                width: 1.w,
                color: ColorApp.green100,
              ),
            ),
            child: Row(
              children: [
                Container(
                    height: 44.h,
                    width: 44.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    decoration: BoxDecoration(
                      color:ColorApp.dark100,
                      borderRadius: BorderRadius.circular(12.r),

                    ),
                    child: Icon(CupertinoIcons.mail_solid,color: ColorApp.blue40,size: 24.sp,)


                ),
                SizedBox(
                  width: 16.h,
                )
                ,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Send via Email",style: GoogleFonts.plusJakartaSans(
                      color: ColorApp.blue60,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,),
                    ),
                    Text("bryan.adam83@gmail.com",style: GoogleFonts.plusJakartaSans(
                      color: ColorApp.blue100,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24.h,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingView(),));
            },
              child: CustomButtonApp(text: "Continue",)),

        ],
      ),
    );
  }
}