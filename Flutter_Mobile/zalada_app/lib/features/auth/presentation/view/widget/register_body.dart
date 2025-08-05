import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalada_app/features/auth/manager/register_logic/register_state.dart';
import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/image_app.dart';
import '../../../../../core/constant/router_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../../../core/widgets/custom_button_app.dart';
import '../../../../../core/widgets/custom_text_field_app.dart';
import '../../../manager/register_logic/register_cubit.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: context.watch<RegisterCubit>().state is RegisterLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: context.watch<RegisterCubit>().formKey,
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
                    controller: context.watch<RegisterCubit>().emailController,
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
                    notShowPassword: context
                        .watch<RegisterCubit>()
                        .notShowPassword_1,
                    colorEnableBorder: ColorApp.light60,
                    colorFocusedBorder: ColorApp.light60,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<RegisterCubit>().togglePasswordVisibility(
                          switchValue: 1,
                        );
                      },
                      icon: context.watch<RegisterCubit>().notShowPassword_1
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility_rounded),
                    ),
                    textHint: "Password",
                    colorHint: ColorApp.dark25,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    controller: context
                        .watch<RegisterCubit>()
                        .passwordController,
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
                    notShowPassword: context
                        .watch<RegisterCubit>()
                        .notShowPassword_2,
                    colorEnableBorder: ColorApp.light60,
                    colorFocusedBorder: ColorApp.light60,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<RegisterCubit>().togglePasswordVisibility(
                          switchValue: 2,
                        );
                      },
                      icon: context.watch<RegisterCubit>().notShowPassword_2
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility_rounded),
                    ),
                    textHint: "Password",

                    colorHint: ColorApp.dark25,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      if (value !=
                          context
                              .read<RegisterCubit>()
                              .passwordController
                              .text) {
                        return "Password is not match";
                      }
                      return null;
                    },
                    controller: context
                        .watch<RegisterCubit>()
                        .confirmPasswordController,
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
                    onPressed: ()  {
                      if (context
                          .read<RegisterCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                         context.read<RegisterCubit>().fetchRegister(
                          email: context
                              .read<RegisterCubit>()
                              .emailController
                              .text,
                          password: context
                              .read<RegisterCubit>()
                              .passwordController
                              .text,
                        );
                        
                        context.read<RegisterCubit>().emailController.clear();
                        context
                            .read<RegisterCubit>()
                            .passwordController
                            .clear();
                        context
                            .read<RegisterCubit>()
                            .confirmPasswordController
                            .clear();
                        FocusScope.of(context).unfocus();
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
      ),
    );
  }
}
