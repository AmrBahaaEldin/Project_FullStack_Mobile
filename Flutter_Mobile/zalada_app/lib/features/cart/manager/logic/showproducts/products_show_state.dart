
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';

abstract class ProductsShowState {}

final class ProductsShowInitial extends ProductsShowState {}
final class  ProductsShowLoading extends ProductsShowState {}
final class ProductsShowLoaded extends ProductsShowState {
  final HomeProducesModel userCartModel;
  ProductsShowLoaded({required this.userCartModel});
}
final class ProductsShowFailure extends ProductsShowState {
  final Failure failure;
  ProductsShowFailure({required this.failure});
}
