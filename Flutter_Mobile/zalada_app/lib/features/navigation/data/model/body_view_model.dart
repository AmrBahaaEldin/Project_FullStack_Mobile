import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/features/home/presentation/view/home_body_view.dart';
import 'package:zalada_app/features/profile/presentation/view/profile_body_view.dart';
import 'package:zalada_app/features/search/data/repo/search_repo_impl.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_cubit.dart';
import 'package:zalada_app/features/search/presentation/view/search_body_view.dart';

class BodyViewModel {
  BodyViewModel._();
  static List<Widget> boyWidgets = [
    const HomeBodyView(),
    BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
      child: const SearchBodyView(),
    ),
    const Center(child: Text('❤️ Favorites', style: TextStyle(fontSize: 24))),
    const Center(child: Text('❤️ Cart', style: TextStyle(fontSize: 24))),
    const ProfileBodyView(),
  ];
}
