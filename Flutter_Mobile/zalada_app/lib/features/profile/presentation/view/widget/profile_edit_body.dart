import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/core/widgets/custom_drop_down_app.dart';
import 'package:zalada_app/core/widgets/custom_phone_number_field.dart';
import 'package:zalada_app/core/widgets/custom_text_field_app.dart';

class ProfileEditBody extends StatelessWidget {
  const ProfileEditBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: ColorApp.blue60,
      ),
      color: ColorApp.dark50,
      blur: BorderSide.strokeAlignOutside,
      inAsyncCall: false,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FirstName",
                style: StylesTextApp.textStyle12.copyWith(
                  color: ColorApp.dark25,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextFieldApp(
                colorHint: ColorApp.dark25,
                controller: TextEditingController(),
    
                keyboardType: TextInputType.name,
                textHint: "Bryan Adam",
                colorEnableBorder: ColorApp.blue80,
                colorFocusedBorder: ColorApp.blue80,
              ),
              SizedBox(height: 16.h),
              Text(
                "EmailAddress",
                style: StylesTextApp.textStyle12.copyWith(
                  color: ColorApp.dark25,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextFieldApp(
                colorEnableBorder: ColorApp.blue100,
                colorFocusedBorder: ColorApp.blue100,
                controller: TextEditingController(),
                colorHint: ColorApp.dark25,
                keyboardType: TextInputType.emailAddress,
                textHint: "bryan.adam87@gmail.com",
              ),
              SizedBox(height: 16.h),
              Text(
                "PhoneNumber",
                style: StylesTextApp.textStyle12.copyWith(
                  color: ColorApp.dark25,
                ),
              ),
              SizedBox(height: 8.h),
              const CustomPhoneNumberField(),
              SizedBox(height: 16.h),
              const CustomDropDown(),
              SizedBox(height: 24.h),
              const CustomButtonApp(
                text: "Save Changes",
                boxColor: ColorApp.blue80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
