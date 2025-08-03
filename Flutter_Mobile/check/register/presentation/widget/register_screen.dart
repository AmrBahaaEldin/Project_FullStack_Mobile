import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/features/register/logic/register_cubit.dart';
import 'package:e_commerce_app/features/register/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/widgets/custom_sign_log.dart';
import '../../../../core/widgets/custom_line_continous.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../login/presentation/widget/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if(state is RegisterSuccess){
              if(state.registerModel.status)
               {
                 Fluttertoast.showToast(
                     msg: state.registerModel.message,
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 5,
                     backgroundColor: Colors.green,
                     textColor: Colors.white,
                     fontSize: 16.0
                 );
               }
              else {
                Fluttertoast.showToast(
                    msg: state.registerModel.message,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: RegisterCubit.get(context).formKey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: MediaQuery
                          .of(context)
                          .viewInsets
                          .bottom
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Your new \n account",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.fontColor,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextField(
                        controller: RegisterCubit
                            .get(context)
                            .userNameController,
                        keyboardType: TextInputType.name,
                        labelText: "userName",
                        hintText: "User name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your UserName";
                          }
                          return null;
                        },


                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        controller: RegisterCubit
                            .get(context)
                            .phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: "phoneNumber",
                        hintText: "phoneNumber",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your phoneNumber";
                          }
                          return null;
                        },


                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your Email";
                          }
                          return null;
                        },

                        controller: RegisterCubit
                            .get(context)
                            .emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email address",
                        labelText: "Email",
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          isHidden: context
                              .read<RegisterCubit>()
                              .isShowPassword,
                          controller: RegisterCubit
                              .get(context)
                              .passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: IconButton(onPressed: () {
                            RegisterCubit.get(context).setHide();
                          }, icon: Icon(context
                              .read<RegisterCubit>()
                              .icon)

                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      ConditionalBuilder(condition: state is ! RegisterLoading, builder: (context) =>CustomTextButton(label: "Register", onTap: () {
                        final registerCubit = RegisterCubit.get(context);
                        if (registerCubit.formKey.currentState!.validate()) {
                          RegisterCubit.get(context)
                              .userRegister(
                            registerCubit.emailController.text.trim(),
                            registerCubit.userNameController.text.trim(),
                            registerCubit.passwordController.text.trim(),
                            registerCubit.phoneController.text.trim(),
                          );
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false,);

                        }
                      },), fallback:(context) =>  Center(child: CircularProgressIndicator())),

                      SizedBox(height: 24.h),
                      CustomLineContinous(),
                      SizedBox(
                        height: 24.h,
                      ),

                      CustomSignLog(
                        textLogo: "Continue with facebook",
                        imageLogo: AppImage.logoFaceBook,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.plusJakartaSans(
                              color: AppColor.subFontColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  },));
                            },
                            child: CustomText(

                              text: "Login",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.importFontColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
