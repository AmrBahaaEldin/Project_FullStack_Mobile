import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/order/presentation/select_payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(width: 1.w,color: AppColor.backgroundColor),),

      child: Row(
        children: [
          Image.asset( (AppImage.card1),height: 32.h,width: 32.w,),
          SizedBox(
            width: 16.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "MasterCard",
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
              CustomText(
                text: "**** **** 0783 7873",
                color: AppColor.subFontColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return SelectPaymentScreen();
              },));
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),

        ],
      ),
    );
  }
}