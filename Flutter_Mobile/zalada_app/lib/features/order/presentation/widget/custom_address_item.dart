import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressItem extends StatefulWidget {
  const CustomAddressItem({super.key});

  @override
  State<CustomAddressItem> createState() => _CustomAddressItemState();
}

class _CustomAddressItemState extends State<CustomAddressItem> {
  bool isSelectPayment = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelectPayment = !isSelectPayment;
        });
      },
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
              width: 1.w,
              color: isSelectPayment ? Colors.orange : AppColor.subFontColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                  decoration: ShapeDecoration(
                      color: AppColor.backgroundColor, shape: CircleBorder()),
                  child: Image.asset(AppImage.homeAddress),
                ),
                SizedBox(
                  width: 8.h,
                ),
                CustomText(text: "Home", fontSize: 14.sp,
                  color: isSelectPayment ? Colors.orange : AppColor.fontColor,fontWeight: FontWeight.w600,),


              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Jl. Pangkur, Ngaglik, Sleman,Yogyakarta",
                        color: AppColor.fontColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        text: "+62812 788 61 1672 ",
                        color: AppColor.subFontColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                ),
                Image.asset( AppImage.markMap,height: 64.h,width: 64.w,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}