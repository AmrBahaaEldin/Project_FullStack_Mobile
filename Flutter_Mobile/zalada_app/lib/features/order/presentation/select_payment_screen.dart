import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:e_commerce_app/features/order/presentation/widget/add_other_method.dart';
import 'package:e_commerce_app/features/order/presentation/widget/payment_method.dart';
import 'package:e_commerce_app/features/payment/presentation/widget/custom_payment_add_method.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPaymentScreen extends StatelessWidget {
  const SelectPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 44.h,
                  width: 44.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(34.r),
                        bottomRight: Radius.circular(34.r),
                        topLeft: Radius.circular(34.r),
                        topRight: Radius.circular(34.r),
                      ),
                      border: Border.all(
                          color: AppColor.fontLabelColor, width: 1.w)),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 20.sp,
                  )),
            ),
            CustomText(
              text: "Payment Method",
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            SizedBox(height: 10.h,)

          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(right: 20.w,left: 20.w,top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentMethod(),
            SizedBox(height: 20.h,),
            PaymentMethod(),
            SizedBox(height: 24.h,),
            CustomText(
                text: "Add Another Payment Method",
                fontSize: 18.sp,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600),
            SizedBox(height: 16.h,),
            CustomPaymentAddMethod(),
            SizedBox(height: 16.h,),
            AddOtherMethod(),
            SizedBox(height: 16.h,),
            AddOtherMethod(),
            SizedBox(height: 24.h,),
            CustomText(
                text: "PayLater",
                fontSize: 18.sp,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600),
            SizedBox(height: 16.h,),
            AddOtherMethod(),


          ],
        ),
      ),
    );
  }
}
