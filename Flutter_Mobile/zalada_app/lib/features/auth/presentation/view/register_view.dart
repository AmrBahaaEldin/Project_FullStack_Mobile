import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/auth/data/repo/repo_register/repo_register_impl.dart';
import 'package:zalada_app/features/auth/manager/register_logic/register_cubit.dart';
import 'package:zalada_app/features/auth/manager/register_logic/register_state.dart';
import 'package:zalada_app/features/auth/presentation/view/widget/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(RepoRegisterImpl(ApiService(Dio()))),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ToastMessage.showToast(
              backGroundColor: Colors.green,
              message: "Register Success",
            );
            controllerClear(context);

            GoRouter.of(context).replace(RouterApp.login);
          }
          if (state is RegisterError) {
            // Handle login failure
            ToastMessage.showToast(
              backGroundColor: Colors.red,
              message: "Register Failed",
            );
          } else if (state is RegisterLoading) {
            // Optionally show a loading indicator
            Fluttertoast.showToast(msg: "Loading...");
          }
        },
        builder: (context, state) {
          return const Scaffold(body: RegisterBody());
        },
      ),
    );
  }

  void controllerClear(BuildContext context) {
    context.read<RegisterCubit>().emailController.clear();
    context.read<RegisterCubit>().passwordController.clear();
    context.read<RegisterCubit>().confirmPasswordController.clear();
  }
}
