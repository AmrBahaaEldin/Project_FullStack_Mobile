import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/features/auth/presentation/view/register_view.dart';
import 'package:zalada_app/features/intro/presentation/view/onboarding_view.dart';
import 'package:zalada_app/features/navigation/presentation/view/navigation_main_view.dart';
import '../../features/auth/presentation/view/login_view.dart';

class RouterApp {
  RouterApp._();

  static const String onBoarding = '/onBoarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String mainNavigation = '/';
  static const String homeView = '/homeView';
  static const String setupAccount = '/setupAccount';
  static const String addNewAccount = '/addNewAccount';
  static const String successRegister = '/successRegister';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      /////////////////////////////////////////
      GoRoute(
        path: onBoarding,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      ///////////////////////////////////////////////////
      GoRoute(
        path: login,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 1000),
            child: const LoginView(),
          );
        },
      ),
      /////////////////////////////////////////
      GoRoute(
        path: mainNavigation,
        builder: (context, state) {
          return  NavigationMainView();
        },
      ),
      ///////////////////////////
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterView(),
      ),
    ],
  );
}
