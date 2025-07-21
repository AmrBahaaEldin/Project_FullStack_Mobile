import 'package:expensetracker/features/auth/presentation/view/widget/add_new_account.dart';
import 'package:expensetracker/features/auth/presentation/view/widget/register-success.dart';
import 'package:expensetracker/features/auth/presentation/view/widget/setup_account.dart';
import 'package:expensetracker/features/home/presentation/view/home_view.dart';
import 'package:expensetracker/features/onboarding/presentation/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login_view.dart';
import '../../features/auth/presentation/register_view.dart';
import '../../features/splash/presentation/splash_view.dart';

class RouterApp {
  RouterApp._();

  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String setupAccount = '/setupAccount';
  static const String addNewAccount = '/addNewAccount';
  static const String successRegister = '/successRegister';
  static const String home = '/home';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: onBoarding,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: animation,
              child: child,
            ),
            transitionDuration: const Duration(
              milliseconds: 1000,
            ),
            child: const OnboardingView(),
          );
        },
      ),
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: setupAccount,
        builder: (context, state) => const SetupAccount(),
      ),
      GoRoute(
        path: addNewAccount,
        builder: (context, state) => const AddNewAccount(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: successRegister,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const RegisterSuccess(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      key: state.pageKey,
              opacity: animation,
              child: child,
           
            ),
            transitionDuration: const Duration(
              milliseconds: 1000,
            ),

          );
        },
      )
    ],
  );
}
