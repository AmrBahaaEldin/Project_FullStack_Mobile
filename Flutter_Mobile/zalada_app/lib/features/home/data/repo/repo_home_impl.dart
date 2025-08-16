import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';
import 'package:zalada_app/features/home/data/repo/repo_home.dart';

class RepoHomeIm implements RepoHome {
  RepoHomeIm(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, HomeProducesModel>> fetchProduces({
    required String categoryProduce,
  }) async {
    try {
      final response = await apiService.get(
        endpoint: ApiKeyApp.endPointCategoryProduce + categoryProduce,
        baseUrl: ApiKeyApp.baseUrlKey,
      );
      return (right(HomeProducesModel.fromJson(response.data)));
    } on DioException catch (e) {
      return (left(ServerFailure.fromDioException(e)));
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }
}
