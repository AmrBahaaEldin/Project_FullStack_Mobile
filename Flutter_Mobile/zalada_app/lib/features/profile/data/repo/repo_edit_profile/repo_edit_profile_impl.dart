import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model.dart';
import 'package:zalada_app/features/profile/data/model/edit_profile_model/edit_profile_model_input.dart';
import 'package:zalada_app/features/profile/data/repo/repo_edit_profile/repo_edit_profile.dart';

class RepoEditProfileImpl implements RepoEditProfile {
  RepoEditProfileImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failure, EditProfileModel>> updataProfile({
    required int userId,
    EditProfileInputModel? editProfileInputModel,
  }) async {
    try {
      final response = await apiService.put(
        endPoint: ApiKeyApp.endPointEditProfile,
        baseurl: ApiKeyApp.baseUrlKey,
        idUser: userId,
        data: EditProfileInputModel(
          email: editProfileInputModel!.email,
          birthDate: editProfileInputModel.firstName,
          firstName: editProfileInputModel.firstName,
          gender: editProfileInputModel.gender,
          phone: editProfileInputModel.phone,
        ).toJson(),
      );
      return Right(EditProfileModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
