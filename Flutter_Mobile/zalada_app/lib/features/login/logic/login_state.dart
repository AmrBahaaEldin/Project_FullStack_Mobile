part of 'login_cubit.dart';


abstract class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginError extends LoginState {
  String error;
  LoginError({required this.error});
}
final class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}
final class LoginHidePassword extends LoginState {}

