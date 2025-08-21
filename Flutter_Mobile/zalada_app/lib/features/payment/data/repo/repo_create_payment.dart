import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';

abstract class RepoCreatePayment {
  Future<Either<Failure, void>> makePayment({
    required String customerName,
    required String amount,
  });
}
