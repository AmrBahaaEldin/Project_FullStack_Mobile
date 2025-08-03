import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/constants/app_image.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';

import 'package:e_commerce_app/features/payment/presentation/payment_method_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCreateScreen extends StatefulWidget {
   const PaymentCreateScreen({super.key});

  @override
  State<PaymentCreateScreen> createState() => _PaymentCreateScreenState();
}

class _PaymentCreateScreenState extends State<PaymentCreateScreen> {
TextEditingController  cardNameControl =TextEditingController();

TextEditingController  cardNumberControl =TextEditingController();
TextEditingController  cardDataControl =TextEditingController();
TextEditingController  cardCvvControl =TextEditingController();
GlobalKey<FormState> globalKey=GlobalKey<FormState>();

DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.buttonColor,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Form(
              key: globalKey,
              child: Column(
                children: [
                  Container(
                    height: 229.h,
                    padding:
                        EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                    decoration: BoxDecoration(
                      color: AppColor.buttonColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              height: 44.h,
                              width: 44.h,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 12.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(34.r),
                                    bottomRight: Radius.circular(34.r),
                                    topLeft: Radius.circular(34.r),
                                    topRight: Radius.circular(34.r),
                                  ),
                                  border: Border.all(
                                      color: AppColor.backgroundIcon,
                                      width: 1.w)),
                              child: Icon(
                                color: AppColor.backgroundColor,
                                Icons.arrow_back_outlined,
                                size: 20.sp,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: CustomText(
                            text: "Add New Card",
                            color: AppColor.backgroundColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    width: 375.w,
                    height: 583.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r)),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 126.h,),
                          CustomTextField(
                            validator: (  String? value) {
                              if(value!.isEmpty){
                                return "please enter name";
                              }
                              return null;
                            },
                             onChanged: (value){
                               setState(() {
                                 cardNameControl.text=value;
                               });
                             }  ,
                              labelText: "Card Name",
                              keyboardType: TextInputType.name,
                              controller: cardNameControl),
                          SizedBox(height: 16.h,),
                          CustomTextField(
                              validator: (  String? value) {
                                if(value!.isEmpty){
                                  return "please enter numberCard";
                                }
                                return null;
                              },
                            onChanged: (value) {
                              setState(() {
                                cardNumberControl.text=value;
                              });
        
                              print(cardNumberControl);
                            },
                              labelText: "Card Number",
                              keyboardType: TextInputType.number,
                              controller: cardNumberControl),
                          SizedBox(height: 16.h,),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  validator: (  String? value) {
                                    if(value!.isEmpty){
                                      return "please enter ExpiryDate";
                                    }
                                    return null;
                                  },
                                  isRead: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: _selectedDate ?? DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
        
                                    if (pickedDate != null) {
                                      setState(() {
                                        _selectedDate = pickedDate;
                                        cardDataControl.text = DateFormat('dd/MM').format(pickedDate);
                                      });
                                    }
                                  },
                                  suffixIcon: Icon(Icons.calendar_today_outlined),
                                  labelText: "Expiry Date",
                                  keyboardType: TextInputType.name,
                                  controller: cardDataControl,),
                              ),
                              SizedBox(width: 16.w,),
                              Expanded(child: CustomTextField(
                                  validator: (  String? value) {
                                    if(value!.isEmpty){
                                      return "please enter cvv";
                                    }
                                    return null;
                                  },
                                  labelText: "cvv", keyboardType: TextInputType.number, controller: cardCvvControl))
                            ],
                          ),
                          SizedBox(height: 89.h,),
                          CustomTextButton(label:"Add Payment",onTap: () {
                            if(globalKey.currentState!.validate()){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentMethodScreen(
        
                              ),));
                            }
                          }, ),
        
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 122.h,
              left: 20.w,
              right: 20.w,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                child: Image(
                  image: AssetImage(
                    AppImage.createPayment,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140.h,
              left: 44.w,
              child: CustomText(
                  text: "SOCard",
                  fontSize: 18.sp,
                  color: AppColor.backgroundColor,
                  fontWeight: FontWeight.w700),
            ),
            Positioned(
              top: 199.h,
              left: 44.w,
              child: CustomText(
        
                  text:cardNumberControl.text ,
                  fontSize: 24.sp,
                  color: AppColor.backgroundColor,
                  fontWeight: FontWeight.w600),
            ),
            Positioned(
              top: 268.h,
              left: 44.w,
              child: Column(
                children: [
                  CustomText(
                      text: "Card holder name",
                      fontSize: 10.sp,
                      color: AppColor.backgroundColor,
                      fontWeight: FontWeight.w400),
                  CustomText(
                      text: cardNameControl.text,
                      fontSize: 14.sp,
                      color: AppColor.backgroundColor,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            Positioned(
              top: 268.h,
              left: 154.w,
              child: Column(
                children: [
                  CustomText(
                      text: "Expiry date",
                      fontSize: 10.sp,
                      color: AppColor.backgroundColor,
                      fontWeight: FontWeight.w400),
                  CustomText(
                      text: cardDataControl.text,
                      fontSize: 14.sp,
                      color: AppColor.backgroundColor,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            Positioned(
              top: 265.h,
              right: 44.w,
              child: Image(
                image: AssetImage(AppImage.logoMasterCard),
                height: 40.h,
                width: 60.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
