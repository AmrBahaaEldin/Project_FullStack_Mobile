import 'package:basicrestaurant/features/auth/login/presentation/view/login_view.dart';
import 'package:basicrestaurant/features/menu/presentation/view/menu_view.dart';
import 'package:basicrestaurant/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterApp {
  RouterApp._();

  static const String splash = '/';
  static const String login = '/login';
  static const String menu = '/menu';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
     
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: menu,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const MenuView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      key: state.pageKey,
                      opacity: animation,
                      child: child,
                    ),
            transitionDuration: const Duration(milliseconds: 1000),
          );
        },
      ),
    ],
  );
}
