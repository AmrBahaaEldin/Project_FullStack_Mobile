import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/image_app.dart';
import '../../../../../core/constant/router_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../../../core/widgets/custom_button_app.dart';
import '../../../../../core/widgets/custom_text_field_app.dart';
import '../../../manager/register_logic/register_cubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create your new \naccount",
                  style: StylesTextApp.textStyle32,
                ),
                SizedBox(height: 32.h),
                Text(
                  "Email",
                  style: StylesTextApp.textStyle12.copyWith(
                    color: ColorApp.dark25,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextFieldApp(
                  colorEnableBorder: ColorApp.light60,
                  colorFocusedBorder: ColorApp.light60,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your Email";
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textHint: 'Email Address',
                  colorHint: ColorApp.dark25,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Password",
                  style: StylesTextApp.textStyle12.copyWith(
                    color: ColorApp.dark25,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextFieldApp(
                  colorEnableBorder: ColorApp.light60,
                  colorFocusedBorder: ColorApp.light60,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_rounded),
                  ),
                  textHint: "Password",
                  colorHint: ColorApp.dark25,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                Text(
                  "confirm password",
                  style: StylesTextApp.textStyle12.copyWith(
                    color: ColorApp.dark25,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextFieldApp(
                  colorEnableBorder: ColorApp.light60,
                  colorFocusedBorder: ColorApp.light60,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_rounded),
                  ),
                  textHint: "Password",
                  colorHint: ColorApp.dark25,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    // if (value != passwordController.text) {
                    //   return "Password is not match";
                    // }
                    return null;
                  },
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text(
                    "Forgot Password?",
                    style: StylesTextApp.textStyle16.copyWith(
                      color: ColorApp.dark100,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButtonApp(
                  text: "Register",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await context.read<RegisterCubit>().fetchRegister(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      //  FocusScope.of(context).unfocus();
                    }
                  },
                  boxColor: ColorApp.blue60,
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text(
                    "or continue with",
                    style: StylesTextApp.textStyle16.copyWith(
                      color: ColorApp.dark25,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButtonApp(
                  text: "Continue with google",
                  isTwins: true,
                  textColor: ColorApp.dark100,
                  widget: Image.asset(ImageApp.googleLogoPng, height: 24.h),
                  boxColor: ColorApp.light60,
                  onPressed: () {},
                ),
                SizedBox(height: 16.h),
                CustomButtonApp(
                  text: "Continue with facebook",
                  isTwins: true,
                  textColor: ColorApp.dark100,
                  widget: Image.asset(ImageApp.facebookLogoPng, height: 30.h),
                  boxColor: ColorApp.light60,
                  onPressed: () {},
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Wrap(
                    children: [
                      Text(
                        "Do you have an account? ",
                        style: StylesTextApp.textStyle16.copyWith(
                          color: ColorApp.dark25,
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            GoRouter.of(context).replace(RouterApp.login),
                        child: Text(
                          "Sign in",
                          style: StylesTextApp.textStyle16.copyWith(
                            color: ColorApp.blue80,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
