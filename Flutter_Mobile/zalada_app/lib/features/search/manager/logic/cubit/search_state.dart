import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/product.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoaing extends SearchState {}

final class SearchFailure extends SearchState {
  Failure failure;
  SearchFailure({required this.failure});
}

final class SearchSuccess extends SearchState {
  HomeProducesModel data;
  SearchSuccess({required this.data});
}
