import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/auth/data/model/register_model/register_model.dart';

abstract class RepoRegister {
  Future<Either<Failure, RegisterModel>> registerPost({
    required String email,
    required String password,
  });
}
