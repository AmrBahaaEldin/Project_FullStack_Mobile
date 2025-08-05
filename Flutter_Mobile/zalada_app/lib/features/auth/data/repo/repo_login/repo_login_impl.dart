import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_input_model.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_model.dart';
import 'package:zalada_app/features/auth/data/repo/repo_login/repo_login.dart';

class RepoLoginImpl implements RepoLogin {
  RepoLoginImpl(this.apiService);
  final ApiService apiService;
  @override
  Future<Either<Failure, LoginModel>> postLogin(
    LoginInputModel loginInputModel,) async {
    try {
      final response = await apiService.post(
        endPoint:ApiKeyApp.endPointLogin,
        baseurl:ApiKeyApp.baseUrlKey,
        data: LoginInputModel(userName:loginInputModel.userName,
        password: loginInputModel.password).toJson(),
      );
      return right(LoginModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    }
    catch (e) {
      return left(ServerFailure( e.toString()));
    }
  }
}
