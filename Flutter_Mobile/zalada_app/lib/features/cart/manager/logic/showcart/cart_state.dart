import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/cart/data/model/user_cart_model/user_cart_model.dart';

abstract class CartState {}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final UserCartModel userCartModel;
  CartLoaded({required this.userCartModel});
}

final class CartLoading extends CartState {}

final class CartFailure extends CartState {
  final Failure failure;
  CartFailure({required this.failure});
}
