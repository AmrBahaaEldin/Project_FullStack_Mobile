import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:zalada_app/features/auth/data/model/login_model/login_input_model.dart';
import 'package:zalada_app/features/auth/data/repo/repo_login/repo_login_impl.dart';
import 'package:zalada_app/features/auth/manager/login_logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repoLoginImpl) : super(LoginInitial());
  RepoLoginImpl repoLoginImpl;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool notShowPassword = false;
  void togglePasswordVisibility() {
    notShowPassword = !notShowPassword;
    emit(LoginInitial()); // Emit initial state to rebuild UI
  }

  void fetchLogin(LoginInputModel loginInputModel) async {
    emit(LoginLoading());
    final data = await repoLoginImpl.postLogin(loginInputModel);
    data.fold((faliure) => emit(LoginFailure(failure: faliure)), (data) {
      emit(LoginSuccess(data: data));
    });
  }
}
