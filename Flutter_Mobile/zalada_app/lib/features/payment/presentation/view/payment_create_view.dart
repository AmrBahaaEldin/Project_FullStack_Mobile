import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_button_app.dart';
import 'package:zalada_app/core/widgets/custom_text_field_app.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/payment/manager/logic/payment_create_cubit.dart';
import 'package:zalada_app/features/payment/manager/logic/payment_create_state.dart';

class PaymentCreateView extends StatelessWidget {
  const PaymentCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Create')),
      body: ModalProgressHUD(
        inAsyncCall: context.watch<PaymentCreateCubit>().isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: context.watch<PaymentCreateCubit>().formKey,
            child: Column(
              children: [
                BlocBuilder<PaymentCreateCubit, PaymentCreateState>(
                  builder: (context, state) {
                    return CreditCardWidget(
                      //
                      isHolderNameVisible: true,
                      labelCardHolder: "Name",
                      isChipVisible: true,
                      cardType: CardType.mastercard,
                      enableFloatingCard: true,
                      cardBgColor: ColorApp.blue60,
                      bankName: "Bk Alex",
                      obscureCardCvv: context
                          .watch<PaymentCreateCubit>()
                          .isobscureSecretCode,
                      chipColor: ColorApp.light40,
                      labelExpiredDate: "Expired Date",
                      obscureCardNumber: true,
                      obscureInitialCardNumber: false,
                      labelValidThru: "Expired Date",

                      floatingConfig: const FloatingConfig(
                        isGlareEnabled: true,
                        isShadowEnabled: true,
                        shadowConfig: FloatingShadowConfig(
                          color: ColorApp.dark50,
                        ),
                      ),

                      cardNumber:
                          context.watch<PaymentCreateCubit>().cardNumber ?? "",
                      expiryDate: "",
                      cardHolderName:
                          context.watch<PaymentCreateCubit>().cardHolderName ??
                          "",
                      cvvCode:
                          context.watch<PaymentCreateCubit>().cvvSecret ?? "",
                      showBackView: context
                          .watch<PaymentCreateCubit>()
                          .isBackViewCard,

                      //true when you want to show cvv(back) view
                      onCreditCardWidgetChange: (brand) {
                        brand.brandName;
                      }, // Callback for anytime credit card brand is changed
                    );
                  },
                ),

                SizedBox(height: 30.h),
                CustomTextFieldApp(
                  onChanged: (p0) {
                    context.read<PaymentCreateCubit>().changeHolderName(p0);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your Name holder";
                    }
                    return null;
                  },

                  labelText: "Name Holder",
                  labelStyle: StylesTextApp.textStyle12.copyWith(
                    color: ColorApp.dark25,
                  ),
                  colorEnableBorder: ColorApp.dark25,
                  colorFocusedBorder: ColorApp.blue60,
                ),
                SizedBox(height: 10.h),
                CustomTextFieldApp(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your number Card";
                    }
                    return null;
                  },
                  onChanged: (p0) {
                    context.read<PaymentCreateCubit>().changeNumberCard(p0);
                  },
                  labelText: "Number Card",
                  labelStyle: StylesTextApp.textStyle12.copyWith(
                    color: ColorApp.dark25,
                  ),
                  colorEnableBorder: ColorApp.dark25,
                  colorFocusedBorder: ColorApp.blue60,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldApp(
                        onChanged: (p0) {},

                        suffixIcon: IconButton(
                          onPressed: () {
                            final DateTime now = DateTime.now();
                            final date = showDatePicker(
                              barrierColor: ColorApp.dark25,
                              context: context,
                              initialDate: DateTime(now.year, now.month),
                              firstDate: DateTime(now.year - 5),
                              lastDate: DateTime(now.year + 10),
                            );
                          },
                          icon: const Icon(Icons.date_range),
                        ),
                        textHint: "MM/YY",
                        isReadOnly: true,
                        labelText: "Expired Date",
                        labelStyle: StylesTextApp.textStyle12.copyWith(
                          color: ColorApp.dark25,
                        ),
                        colorEnableBorder: ColorApp.dark25,
                        colorFocusedBorder: ColorApp.blue60,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextFieldApp(
                        onChanged: (p0) {
                          context.read<PaymentCreateCubit>().changeSecretCode(
                            p0,
                          );
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your cvv";
                          }
                          return null;
                        },

                        keyboardType: TextInputType.number,

                        labelText: "cvv",
                        labelStyle: StylesTextApp.textStyle12.copyWith(
                          color: ColorApp.dark25,
                        ),
                        colorEnableBorder: ColorApp.dark25,
                        colorFocusedBorder: ColorApp.blue60,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100.w),
                BlocListener<PaymentCreateCubit, PaymentCreateState>(
                  listener: (context, state) {
                    if (state is PaymentCreateLoaded && state.message != null) {
                      ToastMessage.showToast(
                        backGroundColor: ColorApp.green80,
                        message: "Success Save",
                      );
                    }
                    if (state is PaymentCreateFailure) {
                      ToastMessage.showToast(
                        backGroundColor: ColorApp.red80,
                        message: "Failed Save",
                      );
                    }
                  },
                  child: CustomButtonApp(
                    text: "Save",
                    onPressed: () {
                      if (context
                          .read<PaymentCreateCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<PaymentCreateCubit>().savePayment(
                          cardHolderName: context
                              .read<PaymentCreateCubit>()
                              .cardHolderName!,
                          cardNumber: context
                              .read<PaymentCreateCubit>()
                              .cardNumber!,
                          cvvSecret: context
                              .read<PaymentCreateCubit>()
                              .cvvSecret!,
                        );
                      }
                    },
                    boxColor: ColorApp.blue60,
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
