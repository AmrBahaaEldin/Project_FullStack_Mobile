part of 'order_cubit.dart';

@immutable
sealed class OrderState {}


final class OrderInitial extends OrderState {}
final class OrderSuccess extends OrderState {}
final class OrderError extends OrderState {
  final String error;

  OrderError(this.error);
}
final class OrderLoading extends OrderState {}
