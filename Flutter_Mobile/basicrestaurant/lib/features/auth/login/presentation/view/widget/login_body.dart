import 'package:basicrestaurant/core/widgets/custom_text_field.dart';
import 'package:basicrestaurant/features/auth/login/manger/login_cubit/login_cubit.dart';
import 'package:basicrestaurant/features/auth/login/manger/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/constant/color_app.dart';
import '../../../../../../core/constant/style_app.dart';
import '../../../../../../core/widgets/custom_button_app.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0.sp,
            );
          }
          if (state is LoginError) {
            Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0.sp,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoginLoading,
            child: SingleChildScrollView(
              reverse: true,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                    right: 20.w,
                    left: 20.w,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                  ),
                  child: Column(
                    children: [
                      EasyTextField(
                        controller: emailController,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "please enter email";
                          }
                          return null;
                        },

                        text: "Email",
                        label: "Email",
                        colorLabel: AppColor.black,
                        colorHint: AppColor.gray,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 25.h),
                      EasyTextField(
                        controller: passwordController,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "please enter password";
                          }
                          return null;
                        },
                        isPassword: context.read<LoginCubit>().isShowPassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            context.read<LoginCubit>().changeShowPassword();
                          },
                          icon: Icon(context.read<LoginCubit>().suffixIcon),
                        ),

                        text: "password",
                        label: "password",
                        colorLabel: AppColor.black,
                        colorHint: AppColor.gray,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 45.h),
                      EasyButtonApp(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().getLogin(
                              emailAddress: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        height: 45,
                        text: 'Login',
                        boxColor: AppColor.primary50,

                        textColor: AppColor.white,
                      ),
                      SizedBox(height: 24.h),
                      RichText(
                        text: TextSpan(
                          text: "Doesn't have an account?",
                          style: AppTextStyle.textStyle13.copyWith(
                            color: AppColor.black,
                          ),
                          children: [
                            TextSpan(
                              text: " Sign Up",
                              style: AppTextStyle.textStyle16.copyWith(
                                color: AppColor.primary30,
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
        },
      ),
    );
  }

  Future<void> routerGoHome(BuildContext context) {
    return Future.delayed(const Duration(seconds: 3), () {
      // Router.of(context).;
    });
  }
}
