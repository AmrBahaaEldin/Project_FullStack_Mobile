import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';
import 'package:zalada_app/features/search/data/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  SearchRepoImpl(this.apiService);
  final ApiService apiService;
  @override
  Future<Either<Failure, HomeProducesModel>> searchProdct(String value) async {
    try {
      final response = await apiService.get(
        endpoint: ApiKeyApp.endPointSearchProcuct,
        baseUrl: ApiKeyApp.baseUrlKey,
        queryParameters: value,
      );
      return right(HomeProducesModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
