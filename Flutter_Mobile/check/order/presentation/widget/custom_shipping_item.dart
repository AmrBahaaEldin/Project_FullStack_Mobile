import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShippingItem extends StatelessWidget {
  const CustomShippingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.h,top: 8.h,bottom: 16.h),
      decoration:
      BoxDecoration(
          border: Border.all(width: 2, color: AppColor.backgroundColor),
          borderRadius: BorderRadius.all(Radius.circular(16.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image(
                  height: 30.h,
                  width: 44.w,
                  image: AssetImage("assets/png/Shipping.png")),
              SizedBox(
                width: 16.w,
              ),
              CustomText(
                text: "J&T Express",
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
          Divider(
            height: 1,
            color: AppColor.backgroundColor,
          ),
          CustomText(
              text: "Regular (\$8)",
              fontSize: 14.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600),
          CustomText(
              text: "Estimate time 01 - 03 November",
              fontSize: 12.sp,
              color: AppColor.fontColor,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}