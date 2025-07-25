import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isShowPassword = false;
  IconData suffixIcon = Icons.visibility_off_outlined;
  void changeShowPassword() {
    isShowPassword = !isShowPassword;
    suffixIcon = isShowPassword
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangeShowPasswordState());
  }

  Future<void> getLogin({
    required String emailAddress,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(LoginSuccess(credential.user!.uid));
    }
      on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          emit(LoginError('Invalid email format.'));
          break;
        case 'user-disabled':
          emit(LoginError('This user account has been disabled.'));
          break;
        case 'user-not-found':
          emit(LoginError('No user found with this email.'));
          break;
        case 'wrong-password':
          emit(LoginError('Incorrect password.'));
          break;
        case 'too-many-requests':
          emit(LoginError('Too many login attempts. Try again later.'));
          break;
        case 'operation-not-allowed':
          emit(LoginError('Email/password sign-in is not enabled.'));
          break;
        case 'network-request-failed':
          emit(LoginError('Network error. Please check your connection.'));
          break;
        case 'unknown':
          emit(LoginError('An unknown error occurred.'));
          break;
        default:
          emit(LoginError('Error: ${e.message}'));
      }
    }

  }
  }

