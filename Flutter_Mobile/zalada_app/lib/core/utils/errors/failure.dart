import 'package:dio/dio.dart';

abstract class Failure {
  Failure(this.errorMessage);
  final String errorMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('BadCertificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.formResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Cancel with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure('ConnectionError with ApiServer');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown with ApiServer');
    }
  }
  factory ServerFailure.formResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      print("_____________________________");
      print(response);
      return ServerFailure(response["message"] ?? response["error"]["message"]);
    } else if (statusCode == 404) {
      print("_____________________________");
      print(response);
      return ServerFailure(response["error"]["message"]);
    }
    return ServerFailure("Opps There was an error ,please try again later");
  }
}
