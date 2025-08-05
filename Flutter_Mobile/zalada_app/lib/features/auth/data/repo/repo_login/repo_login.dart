import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_input_model.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_model.dart';

abstract class RepoLogin {
  Future<Either<Failure, LoginModel>> postLogin( LoginInputModel loginInputModel);
}
