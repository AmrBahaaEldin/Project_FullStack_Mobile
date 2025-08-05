import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/auth/data/model/register_model/register_model.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterModel registerModel;
  RegisterSuccess(this.registerModel);
}

final class RegisterError extends RegisterState {
  final Failure messageError;
  RegisterError(this.messageError);
}
