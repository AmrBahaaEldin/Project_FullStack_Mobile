// import 'package:e_commerce_app/core/constants/app_color.dart';
// import 'package:e_commerce_app/core/constants/app_image.dart';
// import 'package:e_commerce_app/core/widgets/custom_text.dart';
// import 'package:e_commerce_app/features/cart/model/card%20_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomOrderItem extends StatelessWidget {
//
//   const CustomOrderItem({
//
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
//
//


// Row(
// children: [
// Container(
// width: 93.51.w,
// height: 94.5.h,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12.r),
// color: AppColor.backgroundColor,
// ),
// child: Image(
// width: 131.w,
// height: 123.h,
// image: AssetImage(AppImage.card1),
// ),
// ),
// SizedBox(
// width: 18,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CustomText(
// text: "Apple Watch Series 7",
// fontSize: 14.sp,
// color: AppColor.fontColor,
// fontWeight: FontWeight.w600),
// SizedBox(
// height: 4.h,
// ),
// CustomText(
// text: "\$910",
// fontSize: 14.sp,
// color: AppColor.importFontColor,
// fontWeight: FontWeight.w700),
// SizedBox(
// height: 8.5.h,
// ),
// Row(
// children: [
// Container(
// width: 28.w,
// height: 28.h,
// alignment: Alignment.center,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(20.r)),
// border: Border.all(
// width: 1,
// color: AppColor.backgroundColor,
// )),
// padding: EdgeInsets.all(6),
// child: Icon(
// CupertinoIcons.minus,
// size: 20,
// color: Color(0xffCACACA),
// ),
// ),
// SizedBox(width: 8.w),
// CustomText(
// text: "1",
// fontSize: 14.sp,
// color: AppColor.fontColor,
// fontWeight: FontWeight.w500),
// SizedBox(width: 8.w),
// Container(
// width: 28.w,
// height: 28.h,
// alignment: Alignment.center,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(20.r)),
// border: Border.all(
// width: 1, color: AppColor.backgroundColor)),
// padding: EdgeInsets.all(6),
// child: Icon(
// CupertinoIcons.add,
// size: 16,
// color: AppColor.fontColor,
// ),
// ),
// SizedBox(
// width: 28.w,
// ),
// Container(
// width: 28.w,
// height: 28.h,
// alignment: Alignment.center,
// decoration: BoxDecoration(
// color: AppColor.backgroundColor,
// borderRadius: BorderRadius.all(
// Radius.circular(20.r),
// ),
// ),
// padding: EdgeInsets.all(6),
// child: Icon(
// Icons.delete_outline,
// size: 16,
// color: AppColor.fontSelectColor,
// ),
// ),
// Spacer(),
// CustomText(
// text: "X1",
// fontSize: 14.sp,
// color: AppColor.fontColor,
// fontWeight: FontWeight.w400),
// ],
// ),
// ],
// ),
// ),
// ],
// );