import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/features/auth/presentation/view/register_view.dart';
import 'package:zalada_app/features/intro/presentation/view/onboarding_view.dart';
import 'package:zalada_app/features/navigation/presentation/view/navigation_main_view.dart';
import 'package:zalada_app/features/payment/manager/logic/payment_create_cubit.dart';
import 'package:zalada_app/features/product/data/model/products_data.dart';
import 'package:zalada_app/features/product/manager/logic/cart_add_cubit.dart';
import 'package:zalada_app/features/product/presentation/view/home_produce_view.dart';
import 'package:zalada_app/features/profile/presentation/view/edit_profile_view.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/cart/data/repo/repo_cart_impl.dart';
import '../../features/payment/presentation/view/payment_create_view.dart';
import '../utils/api_service.dart';

class RouterApp {
  RouterApp._();

  static const String onBoarding = '/onBoarding';
  static const String register = '/register';
  static const String login = '/';
  static const String mainNavigation = '/mainNavigation';
  static const String itemProduce = '/itemproduce';
  static const String editProfile = '/editProfile';
  static const String addNewAccount = '/addNewAccount';
  static const String paymentCreate = '/paymentCreate';

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
          return const NavigationMainView();
        },
      ),
      ///////////////////////////
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => const ProfileEditView(),
      ), GoRoute(
        path: paymentCreate,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => PaymentCreateCubit(),
              child: const PaymentCreateView(),
            ),
      ),
      GoRoute(
        path: itemProduce,
        builder: (context, state) {
          final productsDataModel = state.extra as ProduceData;

          return BlocProvider(
            create: (context) =>
                CartAddCubit(RepoCartImpl(apiService: ApiService(Dio()))),
            child: HomeProduceView(produceData: productsDataModel),
          );
        },
      ),
    ],
  );
}
