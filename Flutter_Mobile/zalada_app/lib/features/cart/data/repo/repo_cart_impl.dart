import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/cart/data/model/user_cart_model/user_cart_model.dart';
import 'package:zalada_app/features/cart/data/repo/repo_cart.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';

class RepoCartImpl implements RepoCart {
  final ApiService apiService;
  RepoCartImpl({required this.apiService});
  @override
  Future<Either<Failure, UserCartModel>> fetchCartUser(int userId) async {
    try {
      final response = await apiService.get(
        endpoint: ApiKeyApp.endPointShowCart + userId.toString(),
        baseUrl: ApiKeyApp.baseUrlKey,
      );
      return (right(UserCartModel.fromJson(response.data)));
    } on DioException catch (e) {
      return (left(ServerFailure.fromDioException(e)));
    } catch (e) {
      return (left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, HomeProducesModel>> fetchAllProducts() async {
  try {
 final response = await  apiService.get(
      endpoint: ApiKeyApp.endPointAllProducts,
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
