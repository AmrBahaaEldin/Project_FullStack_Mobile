import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';
import 'package:zalada_app/core/widgets/custom_text_field_app.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/home/presentation/view/widget/grid_produce.dart';
import 'package:zalada_app/features/search/data/repo/search_repo_impl.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_cubit.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_state.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomTextFieldApp(
              onChanged: (p0) {
                context.read<SearchCubit>().search(p0);
              },
              colorHint: ColorApp.dark50,
              colorEnableBorder: ColorApp.dark50,
              colorFocusedBorder: ColorApp.blue60,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is SearchFailure) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.red100,
                  message: state.failure.errorMessage,
                );
              }
              if (state is SearchSuccess) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.green80,
                  message: "Success Search",
                );
              }
            },
            builder: (context, state) {
              if (state is SearchSuccess) {
                return GridProduce(count: state.data.products!.length, data: state.data.products!);
              } else if (state is SearchFailure) {
                return Center(
                  child: Text(
                    state.failure.errorMessage,
                    style: StylesTextApp.textStyle18.copyWith(
                      color: ColorApp.red100,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: ColorApp.dark50),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
