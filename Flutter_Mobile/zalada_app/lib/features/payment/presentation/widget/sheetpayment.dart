import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/payment/presentation/payment_create_screen.dart';
import 'package:e_commerce_app/features/payment/presentation/widget/custom_payment_add_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSheetPayment extends StatelessWidget {
  const CustomSheetPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
      height: 300.h,
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

          Center(
            child: Container(
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
          ),
          SizedBox(height: 14.h,),
          CustomText(text: "Add new payment method",
              fontSize: 18.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600),
          SizedBox(height: 24.h,),
          CustomPaymentAddMethod(),
          Spacer(),
          GestureDetector(onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => PaymentCreateScreen(),),);
          },
              child: CustomTextButton(label: "Continue",)),

        ],
      ),
    );
  }
}