

import '../../../../core/utils/errors/failure.dart';
import '../../data/model/CartAddModel.dart';

sealed class CartAddState {}

final class CartAddInitial extends CartAddState {}
final class CartAddLoading extends CartAddState {}
final class CartAddLoaded extends CartAddState {
  final CartAddModel cartAddModel;
  CartAddLoaded({required this.cartAddModel});
}
final class CartAddFailure extends CartAddState {
  final Failure failure;
  CartAddFailure({required this.failure});
}

