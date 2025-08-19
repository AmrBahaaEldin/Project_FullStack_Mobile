import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/payment/data/model/payment_intent_input_model.dart';

abstract class RepoCreatePayment {
  Future<Either<Failure,void>>makePayment({
   required PaymentIntentInputModel paymentIntentInputModel
  });
  
}
