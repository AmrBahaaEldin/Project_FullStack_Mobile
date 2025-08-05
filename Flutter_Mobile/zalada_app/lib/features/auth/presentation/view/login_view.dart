import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/auth/data/repo/repo_login/repo_login_impl.dart';
import 'package:zalada_app/features/auth/manager/login_logic/cubit/login_cubit.dart';
import 'package:zalada_app/features/auth/manager/login_logic/cubit/login_state.dart';
import 'package:zalada_app/features/auth/presentation/view/widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(RepoLoginImpl(ApiService(Dio()))),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ToastMessage.showToast(backGroundColor: Colors.green, message: state.data.accessToken!);
            GoRouter.of(context).go(RouterApp.mainNavigation);
          }  if (state is LoginFailure) {
            // Handle login failure
          ToastMessage.showToast(backGroundColor: Colors.red, message: state.failure.errorMessage);
          }
          
        },
        builder: (context, state) {
          return const Scaffold(body: LoginBody());
        },
      ),
    );
  }
}
