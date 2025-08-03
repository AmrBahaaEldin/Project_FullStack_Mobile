import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/features/order/presentation/confirm_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mapController = TextEditingController();
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
              text: "New Address",
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            GestureDetector(
              onTap: () {},
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
                    CupertinoIcons.search,
                    size: 18.sp,
                  )),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImage.mapAddress, width: 335.w, height: 378.h),
              SizedBox(height: 24.h,),
              CustomText(
                  text: "Select your location from the map",
                  fontSize: 18.sp,
                  color: AppColor.fontColor,
                  fontWeight: FontWeight.w600),
              CustomText(
                  text:
                      "Move the pin on the map to find your location and select the delivery address",
                  fontSize: 14.sp,
                  color: AppColor.subFontColor,
                  fontWeight: FontWeight.w400),
              SizedBox(height: 16.h,),
              CustomTextField(
                suffixIcon:Icon(CupertinoIcons.location_solid),
                  labelText: "Address Detail",
                  keyboardType: TextInputType.text,
                  controller: mapController),
              SizedBox(height: 24.h,),
              CustomTextButton(onTap: () {
                return Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ConfirmOrderScreen();
                },));
              },
                  label: "Confirm Address"),
            ],
          ),
        ),
      ),
    );
  }
}
