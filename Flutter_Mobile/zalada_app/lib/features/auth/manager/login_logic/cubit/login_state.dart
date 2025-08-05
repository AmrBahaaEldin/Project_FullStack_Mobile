import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_model.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginModel data;
  LoginSuccess({required this.data});
}

final class LoginFailure extends LoginState {
  final Failure failure;
  LoginFailure({required this.failure});
}
