import 'package:expensetracker/features/onboarding/presentation/widget/onboarding_body.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: OnboardingBody()),
    );
  }
}
