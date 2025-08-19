import 'package:zalada_app/core/utils/errors/failure.dart';

abstract class PaymentPurchaseState {}

final class PaymentPurchaseInitial extends PaymentPurchaseState {}

final class PaymentPurchaseLoading extends PaymentPurchaseState {}

final class PaymentPurchaseLoaded extends PaymentPurchaseState {}

final class PaymentPurchaseFailure extends PaymentPurchaseState {
  Failure failure;
  PaymentPurchaseFailure({required this.failure});
}
