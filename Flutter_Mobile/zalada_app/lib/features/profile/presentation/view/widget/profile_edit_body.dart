import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/core/widgets/custom_drop_down_app.dart';
import 'package:zalada_app/core/widgets/custom_phone_number_field.dart';
import 'package:zalada_app/core/widgets/custom_text_field_app.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model_input.dart';
import 'package:zalada_app/features/profile/data/repo/repo_edit_profile/repo_edit_profile_impl.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_edit_logic/edit_profile_cubit.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_edit_logic/edit_profile_state.dart';

class ProfileEditBody extends StatelessWidget {
  const ProfileEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditProfileCubit(RepoEditProfileImpl(ApiService(Dio()))),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditPRofileSucess) {
            ToastMessage.showToast(
              backGroundColor: ColorApp.green80,
              message: "SucessUpdateProfile",
            );
            controllerClear(context);

            Future.delayed(const Duration(seconds: 3), () {
              if (!context.mounted) {
                return;
              }
              GoRouter.of(context).pop();
            });
          }
          if (state is EditProfileFailure) {
            ToastMessage.showToast(
              backGroundColor: ColorApp.red60,
              message: state.failure.errorMessage,
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: ColorApp.blue60,
            ),
            color: ColorApp.dark50,
            blur: BorderSide.strokeAlignOutside,
            inAsyncCall: state is EditProfileLoading,
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
                      controller: context
                          .watch<EditProfileCubit>()
                          .firstNameController,

                      keyboardType: TextInputType.name,

                      textHint: context
                          .watch<EditProfileCubit>()
                          .textFirstNameHint,
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
                      controller: context
                          .watch<EditProfileCubit>()
                          .emailAddressController,
                      colorHint: ColorApp.dark25,
                      keyboardType: TextInputType.emailAddress,
                      textHint: context.watch<EditProfileCubit>().textEmailHint,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "PhoneNumber",
                      style: StylesTextApp.textStyle12.copyWith(
                        color: ColorApp.dark25,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomPhoneNumberField(
                      hintCode: context
                          .watch<EditProfileCubit>()
                          .codeCountryHint,
                      hintNumber: context
                          .watch<EditProfileCubit>()
                          .numberPhoneHint,
                      controllerNumber: context
                          .watch<EditProfileCubit>()
                          .phoneController,
                      controllerCode: context
                          .watch<EditProfileCubit>()
                          .codeCountryController,
                    ),

                    SizedBox(height: 16.h),
                    CustomDropDown(
                      hintText: context.watch<EditProfileCubit>().genderHint,
                      controller: context
                          .watch<EditProfileCubit>()
                          .genderController,
                    ),
                    SizedBox(height: 24.h),
                    CustomButtonApp(
                      onPressed: () async {
                        updataProfile(context);

                        saveControllerUpdata(context);

                        FocusScope.of(context).unfocus();
                      },
                      text: "Save Changes",
                      boxColor: ColorApp.blue80,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void updataProfile(BuildContext context) {
    context.read<EditProfileCubit>().updataProfile(
      userId: CacheApp.getData(key: "UserId"),
      editProfileInput: EditProfileInputModel(
        email: context.read<EditProfileCubit>().emailAddressController.text,
        phone: context.read<EditProfileCubit>().fullPhone,

        gender: context.read<EditProfileCubit>().genderController.text,
        firstName: context.read<EditProfileCubit>().firstNameController.text,
      ),
    );
  }

  void saveControllerUpdata(BuildContext context) {
    context.read<EditProfileCubit>().textFirstNameHint = context
        .read<EditProfileCubit>()
        .firstNameController
        .text;
    context.read<EditProfileCubit>().textEmailHint = context
        .read<EditProfileCubit>()
        .emailAddressController
        .text;
    context.read<EditProfileCubit>().numberPhoneHint = context
        .read<EditProfileCubit>()
        .phoneController
        .text;

    context.read<EditProfileCubit>().codeCountryHint = context
        .read<EditProfileCubit>()
        .codeCountryController
        .text;

    context.read<EditProfileCubit>().genderHint = context
        .read<EditProfileCubit>()
        .genderController
        .text;
  }

  void controllerClear(BuildContext context) {
    context.read<EditProfileCubit>().phoneController.clear();
    context.read<EditProfileCubit>().codeCountryController.clear();
    context.read<EditProfileCubit>().emailAddressController.clear();
    context.read<EditProfileCubit>().genderController.clear();
    context.read<EditProfileCubit>().firstNameController.clear();
  }
}
