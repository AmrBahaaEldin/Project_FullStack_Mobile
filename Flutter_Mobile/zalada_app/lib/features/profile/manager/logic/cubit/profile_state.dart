import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/profile/data/model/profile_show.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileShow profileShow;

  ProfileLoaded({required this.profileShow});
}

final class ProfileFailure extends ProfileState {
  final Failure failure;

  ProfileFailure({required this.failure});
}
