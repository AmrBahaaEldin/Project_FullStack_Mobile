import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOtherMethod extends StatelessWidget {
  const AddOtherMethod({super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(width: 1.w,color:AppColor.backgroundColor),),

      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: ShapeDecoration(
                color: AppColor.backgroundIcon, shape: CircleBorder()),
            child:Image.asset( AppImage.card2),
          ),
          SizedBox(
            width: 16.h,
          ),
          CustomText(
            text: "Paypal",
            color: AppColor.fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios)


        ],
      ),
    );
  }
}
