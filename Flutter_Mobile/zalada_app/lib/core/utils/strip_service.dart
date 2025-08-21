import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/features/payment/data/model/create_customer_model/create_customer_model.dart';
import 'package:zalada_app/features/payment/data/model/create_ephemeral_key_model/create_ephemeral_key_model.dart';
import 'package:zalada_app/features/payment/data/model/payment_intent_input_model.dart';
import 'package:zalada_app/features/payment/data/model/payment_intent_model/payment_intent_model.dart';

class StripService {
  StripService({required this.apiService});
  ApiService apiService;
  //flow Strip
  // paymentIntentObject create payment_intents (currency and amount)
  //key Secret CreateEphemeralKey(stripVersion, customer ID)
  // initpaymentsheet (merchant display name,intentClientSecret)
  //present payment sheet();

  //_____________________________________________________________________________________//
  ///Create Customer only one Save ID Customer
  ///Create File Customer in Stripe
  Future<CreateCustomerModel> createCustomer({
    required String customerName,
  }) async {
    final resonse = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,

      token: ApiKeyApp.secretKey,
      endPoint: ApiKeyApp.endPointCustomerFilePaymentCreate,
      baseurl: ApiKeyApp.baseUrlStripe,
      data: {"name": customerName},
    );
    return (CreateCustomerModel.fromJson(resonse.data));
  }

    // using this Method is resonse Can't Save in BD BaceEnd
  // is Solve Temp only test
  Future<String> getOrFetch(String customerName) async {
    final String? customerId = CacheApp.getData(key: "customerId");
    if (customerId != null && customerId.isNotEmpty ) {
      return customerId;
    }
    final createcustomer = await createCustomer(customerName: customerName);
    CacheApp.saveData(key: "customerId", value: createcustomer.id);
    return createcustomer.id!;
  }

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    final resonse = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,

      token: ApiKeyApp.secretKey,
      endPoint: ApiKeyApp.endPointPaymentCreate,
      baseurl: ApiKeyApp.baseUrlStripe,
      data: paymentIntentInputModel.toJson(),
    );
    return (PaymentIntentModel.fromJson(resonse.data));
  }

  Future<CreateEphemeralKeyModel> createEphemeralKey({
    required String idCustomer,
  }) async {
    final response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      token: ApiKeyApp.secretKey,
      stripeVersion: "2025-07-30.basil",
      endPoint: ApiKeyApp.endPointEphemeralkeys,
      baseurl: ApiKeyApp.baseUrlStripe,
      data: {"customer": idCustomer},
    );
    return (CreateEphemeralKeyModel.fromJson(response.data));
  }

  //present is controller in ui purchase

  Future initPaymentSheet({
    required CreateEphemeralKeyModel ephemeralKey,
    required PaymentIntentModel paymentIntent,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: "Sonic",
        paymentIntentClientSecret: paymentIntent.clientSecret,

        ///Customer
        customerId: paymentIntent.customer,
        customerEphemeralKeySecret: ephemeralKey.secret,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }



  Future makePayment({
    required String customerName,
    required String amount,
  }) async {
    final createcustomer = await getOrFetch(customerName);

    final paymentIntent = await createPaymentIntent(
      PaymentIntentInputModel(
        amount: amount,
        currency: "USD",
        customerId: createcustomer,
      ),
    );
    final ephemeralKey = await createEphemeralKey(idCustomer: createcustomer);
    await initPaymentSheet(
      ephemeralKey: ephemeralKey,
      paymentIntent: paymentIntent,
    );
    await displayPaymentSheet();
  }
}
