import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/features/auth/data/repo/repo_register_impl.dart';
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
            Fluttertoast.showToast(
              msg: state.registerModel.email!,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          if (state is RegisterError) {
            Fluttertoast.showToast(
              msg: state.messageError.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          final GlobalKey<FormState> formKey = GlobalKey();
          final TextEditingController emailController = TextEditingController();
          final TextEditingController passwordController =
              TextEditingController();
          final TextEditingController confirmPasswordController =
              TextEditingController();
          return Scaffold(
            body: RegisterBody(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
            ),
          );
        },
      ),
    );
  }
}
