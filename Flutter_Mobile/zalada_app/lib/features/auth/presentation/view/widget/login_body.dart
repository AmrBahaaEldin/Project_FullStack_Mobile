import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/image_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../../../core/widgets/custom_button_app.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: GlobalKey(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text( "Login to Your \naccount",style: StylesTextApp.textStyle32,),
                SizedBox(height: 32.h),
                Text( "Email",style: StylesTextApp.textStyle12.copyWith(
                  color: ColorApp.dark25,
                ),),
                SizedBox(height: 8.h),
                CustomTextFieldApp(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your Email";
                    }
                    return null;
                  },
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                  textHint: 'Email Address',
                  colorHint: ColorApp.dark25,
                ),
                SizedBox(height: 16.h),
                Text( "Password",style: StylesTextApp.textStyle12.copyWith(
                  color: ColorApp.dark25,
                ),),
                SizedBox(height: 8.h,),
                CustomTextFieldApp(
                  suffixIcon: IconButton(onPressed: () {

                  }, icon:const Icon(Icons.visibility_rounded) ),
                  textHint: "Password",
                  colorHint: ColorApp.dark25,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  controller: TextEditingController(),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text("Forgot Password?",style: StylesTextApp.textStyle16.copyWith(
                    color: ColorApp.dark100,),
                  ),

                ),
                SizedBox(height: 24.h),
                const CustomButtonApp(text: "Login",
                  boxColor: ColorApp.blue60,),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Text("or continue with",style: StylesTextApp.textStyle16.copyWith(
                    color: ColorApp.dark25,),),
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomButtonApp(text: "Continue with google",
                isTwins: true,
                  widget: Image.asset(ImageApp.googleLogoPng),
                  boxColor: ColorApp.blue60,
                  onPressed: () {

                  },
                )


                // Center(
                //   child: GestureDetector(
                //     // onTap: () {
                //     //   showModalBottomSheet(
                //     //     context: context,
                //     //     builder: (context) {
                //     //       return BackdropFilter(
                //     //         filter: ImageFilter.blur(
                //     //           sigmaX: 5.0,
                //     //           sigmaY: 5.0,
                //     //         ),
                //     //         child: const CustomForgetPasswordSheet(),
                //     //       );
                //     //     },
                //     //   );
                //     // },
                //     child: CustomButtonApp(text: "Forgot Password?"),
                //   ),
                // ),
                // SizedBox(height: 24.h),
                //
                // SizedBox(height: 24.h),
                // CustomLineContinous(),
                // SizedBox(height: 24.h),
                // CustomSignLog(
                //   textLogo: "Continue with google",
                //   imageLogo: ImageApp.bankOfAmericaSV,
                // ),
                // SizedBox(height: 16.h),
                // CustomSignLog(
                //   textLogo: "Continue with facebook",
                //   imageLogo: ImageApp.bankOfAmericaSV,
                // ),
                // SizedBox(height: 24.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const CustomButtonApp(text: "Don't have an account?"),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) {
                //               return const RegisterView();
                //             },
                //           ),
                //         );
                //       },
                //       child: const CustomButtonApp(text: "Register"),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}