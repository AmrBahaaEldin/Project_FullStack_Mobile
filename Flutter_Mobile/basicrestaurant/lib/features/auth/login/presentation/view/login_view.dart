import 'package:basicrestaurant/features/auth/login/presentation/view/widget/login_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/style_app.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Login', style: AppTextStyle.textStyle24,),
      ),
      body: const LoginBody(),
    );
  }
}