import 'package:expensetracker/features/auth/data/models/payment_method_model.dart';

import '../../../../core/constant/image_app.dart';

class PaymentMethodData{
  PaymentMethodData._();
  static final List<PaymentMethodModel> paymentMethods = [
    const  PaymentMethodModel(name: "bankofAmerica", image: ImageApp.bankOfAmericaSV),
    const  PaymentMethodModel(name: "bcaSV", image: ImageApp.bcaSV),
    const  PaymentMethodModel(name: "chaseSV", image: ImageApp.chaseSV),
    const  PaymentMethodModel(name: "citiSV", image: ImageApp.citiSV),
    const  PaymentMethodModel(name: "mandiriSV", image: ImageApp.mandiriSV),
    const  PaymentMethodModel(name: "paypalSV", image: ImageApp.paypalSV),

  ];
}