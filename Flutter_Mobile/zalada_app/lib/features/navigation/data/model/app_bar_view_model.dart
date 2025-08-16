import 'package:flutter/widgets.dart';
import 'package:zalada_app/features/cart/presentation/view/cart_app_bar_view.dart';
import 'package:zalada_app/features/home/presentation/view/home_app_bar_view.dart';
import 'package:zalada_app/features/profile/presentation/view/profile_app_bar_view.dart';
import 'package:zalada_app/features/search/presentation/view/search_app_bar_view.dart';

class AppBarViewModel {
  AppBarViewModel._();
  static List<PreferredSizeWidget> appBarWidget = [
    const HomeAppBarView(),
    const SearchAppBarView(),

    const CartAppBarView(),
    const ProfileAppBarView(),
  ];
}
