import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/core/widgets/custom_button_app.dart';
import 'package:expensetracker/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/payment_method_data.dart';

class AddNewAccount extends StatelessWidget {
  const AddNewAccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.violet100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorApp.violet100,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            color: ColorApp.light100,
            FontAwesomeIcons.arrowLeft,
            size: 19.5.sp,
          ),
        ),
        title: Text(
          'Add new account',
          style: AppTextStyles.textStyle18.copyWith(
              color: ColorApp.light100, decoration: TextDecoration.none),
        ),
      ),
     body: Padding(
       padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  Spacer(),
              //SizedBox(height: 302.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w,),
                child: Text("Balance",
                    style: AppTextStyles.textStyle18.copyWith(
                        color: ColorApp.light40, decoration: TextDecoration.none)),
              ),
              SizedBox(
                height: 13.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w,),
                child: Text("\$00.0",
                    style: AppTextStyles.textStyle64.copyWith(
                        color: ColorApp.light80, decoration: TextDecoration.none)),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 24.h,
                ),
                decoration: BoxDecoration(
                  color: ColorApp.light100,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32.r),
                    topLeft: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EasyTextField(
                      colorHint: ColorApp.light20,
                      text: "Name",
                    ),
                    SizedBox(height: 16.h),
                    const EasyTextField(
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: ColorApp.light20,
                      ),
                      colorHint: ColorApp.light20,
                      text: "Account Type",
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Bank",
                      style: AppTextStyles.textStyle16.copyWith(
                        color: ColorApp.dark100,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    GridView.builder(
                      shrinkWrap: true,
                      physics:  const AlwaysScrollableScrollPhysics(),

                      itemCount: PaymentMethodData.paymentMethods.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 8.h,
                        crossAxisSpacing: 8.w,
                      ),
                      itemBuilder: (context, index) {
                        final paymentItem= PaymentMethodData.paymentMethods[index];
                        return Container(

                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: ColorApp.violet20,
                          ),
                          child: SvgPicture.asset(
                            paymentItem.image,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      height: 40.h,
                    ),
                    const CustomButtonApp(
                      text: "Continue",
                    ),
                  ],
                ),
              ),
            ],
          ),
     ),
      );
  }
}



