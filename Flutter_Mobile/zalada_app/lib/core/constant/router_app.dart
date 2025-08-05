import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/features/auth/presentation/view/register_view.dart';
import 'package:zalada_app/features/intro/presentation/view/onboarding_view.dart';

import '../../features/auth/presentation/view/login_view.dart';

class RouterApp {
  RouterApp._();

  static const String registerTest = '/';
  //static const String onBoarding = '/onBoarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String setupAccount = '/setupAccount';
  static const String addNewAccount = '/addNewAccount';
  static const String successRegister = '/successRegister';
  static const String mainNavigation = '/mainNavigation';
  static const String home = '/home';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: registerTest,
        builder: (context, state) {
          return const RegisterView();
        },
      ),
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
      GoRoute(
        path: home,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      // GoRoute(
      //   path: register,
      //   builder: (context, state) => const RegisterView(),
      // ),
      // GoRoute(
      //   path: setupAccount,
      //   builder: (context, state) => const SetupAccount(),
      // ),
      // GoRoute(
      //   path: addNewAccount,
      //   builder: (context, state) => const AddNewAccount(),
      // ),
      // GoRoute(
      //   path: mainNavigation,
      //   builder: (context, state) => const MainNavigation(),
      // ),
      // GoRoute(path: home, builder: (context, state) => const HomeView()),

      // GoRoute(
      //   path: successRegister,
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //       child: const RegisterSuccess(),
      //       transitionsBuilder:
      //           (context, animation, secondaryAnimation, child) =>
      //               FadeTransition(
      //                 key: state.pageKey,
      //                 opacity: animation,
      //                 child: child,
      //               ),
      //       transitionDuration: const Duration(milliseconds: 1000),
      //     );
      //   },
      // ),
    ],
  );
}
