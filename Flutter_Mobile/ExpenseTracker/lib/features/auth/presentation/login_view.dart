import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/features/auth/presentation/view/widget/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          FontAwesomeIcons.arrowLeft,
          size: 19.5.sp,
        ),
        title: Text(
          'Login',
          style: AppTextStyles.textStyle18.copyWith(
              color: ColorApp.dark50, decoration: TextDecoration.none),
        ),
      ),
      body: const LoginBody(),
    );
  }
}
