import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model.dart';

abstract class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditPRofileSucess extends EditProfileState {
  final EditProfileModel editProfileModel;
  EditPRofileSucess({required this.editProfileModel});
}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileFailure extends EditProfileState {
  final Failure failure;
  EditProfileFailure({required this.failure});
}
