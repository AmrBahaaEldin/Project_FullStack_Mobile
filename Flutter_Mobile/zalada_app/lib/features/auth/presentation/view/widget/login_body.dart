import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_input_model.dart';
import 'package:zalada_app/features/auth/manager/login_logic/cubit/login_cubit.dart';
import 'package:zalada_app/features/auth/manager/login_logic/cubit/login_state.dart';
import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/image_app.dart';
import '../../../../../core/constant/router_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../../../core/widgets/custom_button_app.dart';
import '../../../../../core/widgets/custom_text_field_app.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: context.watch<LoginCubit>().state is LoginLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: context.watch<LoginCubit>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login to Your \naccount",
                    style: StylesTextApp.textStyle32,
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    "UserName",
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
                    controller: context.watch<LoginCubit>().userNameController,
                    keyboardType: TextInputType.text,
                    textHint: 'Username',
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
                        .watch<LoginCubit>()
                        .notShowPassword,
                    colorEnableBorder: ColorApp.light60,
                    colorFocusedBorder: ColorApp.light60,
                    suffixIcon: IconButton(
                      onPressed: () {
                        context.read<LoginCubit>().togglePasswordVisibility();
                      },
                      icon: context.watch<LoginCubit>().notShowPassword
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
                    controller: context.watch<LoginCubit>().passwordController,
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
                    onPressed: () {
                      if (context
                          .read<LoginCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        fetchLogin(context);

                        FocusScope.of(context).unfocus();
                      }
                    },
                    text: "Login",
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
                          "Don't have an account? ",
                          style: StylesTextApp.textStyle16.copyWith(
                            color: ColorApp.dark25,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              GoRouter.of(context).replace(RouterApp.register),
                          child: Text(
                            "Sign up",
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

  void fetchLogin(BuildContext context) {
    context.read<LoginCubit>().fetchLogin(
      LoginInputModel(
        userName: context.read<LoginCubit>().userNameController.text,
        password: context.read<LoginCubit>().passwordController.text,
      ),
    );
  }
}
