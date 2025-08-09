import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/constant/api_key_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/profile/data/model/profile_show.dart';
import 'package:zalada_app/features/profile/data/repo/repo_profile/repo_profile.dart';

class RepoProfileImpl implements RepoProfile {
  RepoProfileImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failure, ProfileShow>> getProfile(String author) async {
    try {
      final response = await apiService.get(
        endpoint: ApiKeyApp.endPointProfile,
        baseUrl: ApiKeyApp.baseUrlKey,
        author: author,
      );
   
      return right(ProfileShow.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
