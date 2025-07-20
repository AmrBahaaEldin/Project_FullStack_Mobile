import 'package:expensetracker/core/constant/style_app.dart';
import 'package:expensetracker/features/auth/presentation/view/widget/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/color_app.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            size: 19.5.sp,
          ),
        ),
        title: Text(
          'Sign Up',
          style: AppTextStyles.textStyle18.copyWith(
              color: ColorApp.dark50, decoration: TextDecoration.none),
        ),
      ),
      body: const RegisterBody(),
    );
  }
}
