import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/order/presentation/add_address_screen.dart';
import 'package:e_commerce_app/features/order/presentation/select_address_screen.dart';
import 'package:e_commerce_app/features/order/presentation/widget/custom_address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAddressScreen extends StatelessWidget {
  const SelectAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.white ,
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
              text: "Select Address",
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressScreen(),));
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
                    Icons.add,
                    size: 18.sp,
                  )),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h,left: 20.w,right: 20.w),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                  itemBuilder: (context, index) => CustomAddressItem(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 16.h,
                      ),
                  itemCount: 3),
              SizedBox(height: 190.h,),


              CustomTextButton(label: "SelectAddress"),

            ],
          ),
        ),
      ),
    );
  }
}


