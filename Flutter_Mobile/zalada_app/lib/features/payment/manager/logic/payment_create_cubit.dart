

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:zalada_app/features/payment/manager/logic/payment_create_state.dart';

class PaymentCreateCubit extends Cubit<PaymentCreateState> {
  PaymentCreateCubit() : super(PaymentCreateInitial());
  String? cardNumber;
  String? cardHolderName;
  String? cvvSecret;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool isBackViewCard = false;
  bool isobscureSecretCode = false;
  DateTime? expiryDate;

  void changeHolderName(String holderName) {
    isBackViewCard = false;
    cardHolderName = holderName;
    emit(PaymentCreateSelected());
  }

  void changeNumberCard(String numberCard) {
    isBackViewCard = false;
    cardNumber = numberCard;

    emit(PaymentCreateSelected());
  }

  void changeSecretCode(String secretCode) {
    cvvSecret = secretCode;
    if (cvvSecret!.isNotEmpty) {
      if (cvvSecret!.length >= 3) {
        isobscureSecretCode = true;
      } else {
        isobscureSecretCode = false;
      }
      isBackViewCard = true;
    } else {
      isBackViewCard = false;
    }
    emit(PaymentCreateSelected());
  }

  void savePayment({
    required String cardHolderName,
    required String cardNumber,
    required String cvvSecret,
  }) {
    isLoading = true;
    emit(PaymentCreateLoaded());
    if (cardHolderName == "Amr BahaaEldin Mohamed" &&
        cardNumber == "400080001000" &&
        cvvSecret == "123") {
      emit(PaymentCreateLoaded(message: "Payment saved successfully"));
      isLoading = false;
    } else {
      emit(PaymentCreateFailure(errorMessage: "Failed to save payment"));
      isLoading = false;
    }
  }
}
