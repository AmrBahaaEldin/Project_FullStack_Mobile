abstract class PaymentCreateState {}

final class PaymentCreateInitial extends PaymentCreateState {}

final class PaymentCreateLoading extends PaymentCreateState {}

final class PaymentCreateLoaded extends PaymentCreateState {
  final String? message;

  PaymentCreateLoaded({this.message});
}

final class PaymentCreateFailure extends PaymentCreateState {
  final String errorMessage;

  PaymentCreateFailure({required this.errorMessage});
}

final class PaymentCreateSelected extends PaymentCreateState {}



final class PaymentCreateSelectedDate extends PaymentCreateState {
  final DateTime dateTime;

  PaymentCreateSelectedDate({required this.dateTime});
}
