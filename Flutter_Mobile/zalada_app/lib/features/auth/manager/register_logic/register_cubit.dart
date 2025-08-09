import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zalada_app/features/auth/data/repo/repo_register/repo_register_impl.dart';
import 'package:zalada_app/features/auth/manager/register_logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.repoRegisterImpl) : super(RegisterInitial());
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RepoRegisterImpl repoRegisterImpl;
  bool notShowPassword_1 = false;
  bool notShowPassword_2 = false;
  void togglePasswordVisibility({required int switchValue}) {
    switch (switchValue) {
      case 1:
        notShowPassword_1 = !notShowPassword_1;
        emit(RegisterInitial());
        break;
      case 2:
        notShowPassword_2 = !notShowPassword_2;
        emit(RegisterInitial());
        break;
    }

    // Emit initial state to rebuild UI
  }

  Future<void> fetchRegister({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    final result = await repoRegisterImpl.registerPost(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(RegisterError(failure));
      },
      (value) {
        emit(RegisterSuccess(value));
      },
    );
  }
}
