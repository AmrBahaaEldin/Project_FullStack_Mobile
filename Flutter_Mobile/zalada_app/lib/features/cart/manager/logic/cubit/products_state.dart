
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';

abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class  ProductsLoading extends ProductsState {}
final class ProductsLoaded extends ProductsState {
  final HomeProducesModel userCartModel;
  ProductsLoaded({required this.userCartModel});
}
final class ProductsFailure extends ProductsState {
  final Failure failure;
  ProductsFailure({required this.failure});
}
