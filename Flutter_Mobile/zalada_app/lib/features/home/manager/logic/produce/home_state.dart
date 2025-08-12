import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeChangeBanner extends HomeState {}

final class HomeLoaded extends HomeState {
  final HomeProducesModel homeProduceModel;
  HomeLoaded(this.homeProduceModel);
}

final class HomeFailure extends HomeState {
  final Failure failure;
  HomeFailure(this.failure);
}
