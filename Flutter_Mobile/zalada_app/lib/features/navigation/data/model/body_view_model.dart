

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/utils/cache_db_app.dart';
import 'package:zalada_app/features/cart/data/repo/repo_cart_impl.dart';
import 'package:zalada_app/features/cart/manager/logic/cubit/products_cubit.dart';
import 'package:zalada_app/features/cart/manager/logic/showcart/cart_cubit.dart';
import 'package:zalada_app/features/cart/presentation/view/cart_body_view.dart';
import 'package:zalada_app/features/home/data/repo/repo_home_impl.dart';
import 'package:zalada_app/features/home/manager/logic/produce/home_cubit.dart';
import 'package:zalada_app/features/home/manager/logic/slider_banner/cubit/slider_banner_cubit.dart';
import 'package:zalada_app/features/home/presentation/view/home_body_view.dart';
import 'package:zalada_app/features/profile/data/repo/repo_profile/repo_profile_impl.dart';
import 'package:zalada_app/features/profile/manager/logic/profile_logic/profile_cubit.dart';
import 'package:zalada_app/features/profile/presentation/view/profile_body_view.dart';
import 'package:zalada_app/features/search/data/repo/search_repo_impl.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_cubit.dart';
import 'package:zalada_app/features/search/presentation/view/search_body_view.dart';

class BodyViewModel {
  BodyViewModel._();
  static List<Widget> boyWidgets = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(RepoHomeIm(ApiService(Dio())))
                ..fetchProduceCategory("tops"),
        ),
        BlocProvider(create: (context) => SliderBannerCubit()),
      ],
      child: const HomeBodyView(),
    ),
    BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
      child: const SearchBodyView(),
    ),
    const Center(child: Text('❤️ Favorites', style: TextStyle(fontSize: 24))),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CartCubit(RepoCartImpl(apiService: ApiService(Dio())))
                ..fetchCart(),
        ),
        BlocProvider(create: (context) => ProductsCubit(RepoCartImpl(apiService: ApiService(Dio())))..fetchAllProducts()),
       
      ],
      child: const CartBodyView(),
    ),
    BlocProvider(
      create: (context) {
        final String auth = CacheApp.getData(key: "accessToken");
        return ProfileCubit(RepoProfileImpl(ApiService(Dio())))
          ..fecthDataProfile(author: auth);
      },
      child: const ProfileBodyView(),
    ),
  ];
}
