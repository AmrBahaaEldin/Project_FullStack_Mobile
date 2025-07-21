import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/router_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/core/widgets/custom_button_app.dart';
import 'package:expensetracker/core/widgets/custom_text_field.dart';
import 'package:expensetracker/features/auth/presentation/view/widget/grid_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AddNewAccount extends StatefulWidget {
  const AddNewAccount({super.key});

  @override
  State<AddNewAccount> createState() => _AddNewAccountState();
}

class _AddNewAccountState extends State<AddNewAccount> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "Balance",
              style: AppTextStyles.textStyle18.copyWith(
                color: ColorApp.light40,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 13.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "\$00.0",
              style: AppTextStyles.textStyle64.copyWith(
                color: ColorApp.light80,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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
                EasyTextField(
                  isreadOnly: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => isShow = !isShow);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: ColorApp.light20,
                    ),
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
                if (isShow) const GridPaymentMethod(),
                SizedBox(height: 40.h),
                CustomButtonApp(
                  onPressed: () {
                    GoRouter.of(context).push(RouterApp.successRegister);
                  },
                  text: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
