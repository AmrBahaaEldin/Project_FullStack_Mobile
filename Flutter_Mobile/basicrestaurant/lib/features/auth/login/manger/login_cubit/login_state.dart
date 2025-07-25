
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState{}
final class LoginSuccess extends LoginState{
  LoginSuccess(this.message);
  final String message;

}
final class LoginError extends LoginState{
  LoginError(this.error);
  final String error;

}
final class ChangeShowPasswordState extends LoginState{

}