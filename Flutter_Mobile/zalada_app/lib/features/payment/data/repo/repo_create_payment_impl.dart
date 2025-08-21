import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart' show Either, Right, Left;
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/core/utils/strip_service.dart';
import 'package:zalada_app/features/payment/data/repo/repo_create_payment.dart';

class RepoCreatePaymentImpl implements RepoCreatePayment {
  final StripService stripService;

  RepoCreatePaymentImpl({required this.stripService});
  @override
  Future<Either<Failure, void>> makePayment({
    required String customerName,
    required String amount,
  }) async {
    try {
      await stripService.makePayment(
        amount: amount,
        customerName:customerName, 
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
