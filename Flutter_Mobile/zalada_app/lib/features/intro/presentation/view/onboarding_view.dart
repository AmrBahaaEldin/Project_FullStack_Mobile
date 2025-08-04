import 'package:flutter/material.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/intro/presentation/view/widget/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorApp.dark100,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Skip",
              style: StylesTextApp.textStyle14.copyWith(
                color: ColorApp.dark100,
              ),
            ),
          ),
        ],
      ),
      body: const OnboardingBody(),
    );
  }
}

