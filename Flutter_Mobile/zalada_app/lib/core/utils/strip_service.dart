import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/features/payment/data/model/payment_intent_input_model.dart';
import 'package:zalada_app/features/payment/data/model/payment_intent_model/payment_intent_model.dart';

class StripService {
  StripService({required this.apiService});
  ApiService apiService;
  //flow Strip
  // paymentIntentObject create payment method (currency and amount)
  // create payment intent(client secret)
  //present payment sheet();

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final resonse = await apiService.post(
      token: ApiKeyApp.secretKey,
      endPoint: ApiKeyApp.endPointPaymentCreate,
      baseurl: ApiKeyApp.baseUrlKey,
      data: paymentIntentInputModel.toJson(),
    );
    return (PaymentIntentModel.fromJson(resonse.data));
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Sonic",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    final paymentIntent = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntent.clientSecret!,
    );
    await displayPaymentSheet();
  }
}
