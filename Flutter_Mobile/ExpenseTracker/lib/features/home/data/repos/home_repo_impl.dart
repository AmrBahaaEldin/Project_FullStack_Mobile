// import 'package:book_store/core/constant/api_app.dart';
// import 'package:book_store/core/utils/api_service.dart';
// import 'package:book_store/core/utils/errors/failure.dart';
// import 'package:book_store/features/home/data/models/book_model/book_model.dart';
// import 'package:book_store/features/home/data/repos/home_repo.dart';
// import 'package:dio/dio.dart';
// import 'package:fpdart/fpdart.dart';
//
// class HomeRepoImpl implements HomeRepo {
//   HomeRepoImpl(this.apiService);
//   final ApiServivce apiService;
//
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
//     try {
//       final data = await apiService.get(endPonit: ApiApp.showBooks);
//
//       return right(data);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       }
//
//       return left(ServerFailure(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async {
//     try {
//       final data = await apiService.get(endPonit: ApiApp.showBooks);
//
//       return right(data);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       }
//
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
