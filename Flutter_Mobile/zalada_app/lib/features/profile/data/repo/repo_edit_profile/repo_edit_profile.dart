import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model_input.dart';

abstract class RepoEditProfile {
  Future<Either<Failure, EditProfileModel>> updataProfile({
    required int userId,
    EditProfileInputModel editProfileInputModel,
  });
}
