

import 'package:e_commerce_app/features/register/data/register_model.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
 final RegisterModel registerModel;

  RegisterSuccess({required this.registerModel});
}
final class RegisterError extends RegisterState {
  final String error;
  RegisterError({required this.error});
}
final class RegisterHide extends RegisterState {}
