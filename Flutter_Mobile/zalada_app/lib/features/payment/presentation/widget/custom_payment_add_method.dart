import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentAddMethod extends StatefulWidget {
  const CustomPaymentAddMethod({
    super.key,

  });

  @override
  State<CustomPaymentAddMethod> createState() => _CustomPaymentAddMethodState();
}

class _CustomPaymentAddMethodState extends State<CustomPaymentAddMethod> {
 bool isSelectPayment=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       setState(() {
         isSelectPayment =! isSelectPayment;
       });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(width: 1.w,color:isSelectPayment?Colors.orange:AppColor.backgroundColor),),

        child: Row(
          children: [
            Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: ShapeDecoration(
                  color: AppColor.backgroundColor, shape: CircleBorder()),
              child:Image.asset( "assets/png/creditcard.png"),
            ),
            SizedBox(
              width: 16.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Credit or Debit Card",
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 8.h,),
                CustomText(
                  text: "Pay with your Visa or Mastercard ",
                  color: AppColor.subFontColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ],
            ),
            Spacer(),


          ],
        ),
      ),
    );
  }
}