import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/features/payment/data/payment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentItemMethod extends StatelessWidget {
  final int index;
  const CustomPaymentItemMethod({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        border: Border.all(width: 1.w,color: AppColor.subFontColor),),

      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 44.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: ShapeDecoration(
                color: AppColor.backgroundColor, shape: CircleBorder()),
            child:Image.asset( paymentModel[index].image),
          ),
          SizedBox(
            width: 16.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: paymentModel[index].title,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
              CustomText(
                text: paymentModel[index].subtitle,
                color: AppColor.fontColor,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios),
          )
        ],
      ),
    );
  }
}
