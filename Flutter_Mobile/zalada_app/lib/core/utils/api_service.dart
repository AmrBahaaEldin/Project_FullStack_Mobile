import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final Dio dio;
  Future<dynamic> post({
    required String endPoint,
    required String baseurl,
    required Object data,
  }) async {
    final response = await dio.post(
      baseurl + endPoint,
      data: data,
      options: Options(contentType: Headers.jsonContentType),
    );

    return response;
  }

  Future<dynamic> get({
    required String endpoint,
    required String baseUrl,
    String? author,
    String? queryParameters,
  }) async {
    final response = await dio.get(
      baseUrl + endpoint,
      queryParameters: {"q": queryParameters},

      options: Options(
        contentType: Headers.jsonContentType,
        headers: {"Authorization": "Bearer $author"},
      ),
    );
    return response;
  }

  Future<dynamic> put({
    required String endPoint,
    required String baseurl,
    required int idUser,
    Object? data,
  }) async {
    final response = await dio.put(
      "$baseurl$endPoint$idUser",
      options: Options(contentType: Headers.jsonContentType),
      data: data,
    );
    return response;
  }
}
