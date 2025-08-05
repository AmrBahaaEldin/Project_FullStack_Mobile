import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/auth/data/model/register_model/register_input_model.dart';
import 'package:zalada_app/features/auth/data/model/register_model/register_model.dart';
import 'package:zalada_app/features/auth/data/repo/repo_register/repo_register.dart';

class RepoRegisterImpl implements RepoRegister {
  RepoRegisterImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, RegisterModel>> registerPost({
    required String email,
    required String password,
  }) async {
    try {
      final result = await apiService.post(
        baseurl: ApiKeyApp.baseUrlKey,
        endPoint: ApiKeyApp.endPointRegister,
        data: RegisterInputModel(email: email, password: password).toJson(),
      );
      return Right(RegisterModel.fromJson(result.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure("Unexpected error: $e"));
    }
  }
}
