import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/image_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/utils/api_service.dart';

import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/home/data/model/category/category_item_data.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/product.dart';
import 'package:zalada_app/features/home/data/repo/repo_home_impl.dart';
import 'package:zalada_app/features/home/manager/logic/home_cubit.dart';
import 'package:zalada_app/features/home/manager/logic/home_state.dart';
import 'package:zalada_app/features/home/presentation/view/widget/category_item.dart';
import 'package:zalada_app/features/home/presentation/view/widget/item_produces.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RepoHomeIm(ApiService(Dio())))..fetchProduceCategory("tops"),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoaded) {
            ToastMessage.showToast(
              backGroundColor: ColorApp.green80,
              message: state.homeProduceModel.products![0].category!,
            );
          }
          if (state is HomeFailure) {
            ToastMessage.showToast(
              backGroundColor: ColorApp.red100,
              message: state.failure.errorMessage,
            );
          }
        },
        builder: (context, state) {
          if(state is HomeLoaded){
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Text("Categories", style: StylesTextApp.textStyle16),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 60.h,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          GestureDetector(
                            onTap: () {
                              context.read<HomeCubit>().fetchProduceCategory(
                                  CategoryItemData.dataItem[index].text);
                            },
                            child: CategoryItem(
                              data: CategoryItemData.dataItem[index],
                            ),
                          ),
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8.w);
                      },
                      itemCount: CategoryItemData.dataItem.length,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.homeProduceModel.products!.length,
                        (context, index) =>
                        ItemProduces(
                          data: state.homeProduceModel.products![index],
                        ),
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1, //width/height
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h, //between 2 row axis y
                    crossAxisSpacing: 10.w, //between 2 column axis x ),
                  ),
                ),
              ],
            );
          }
          else if (state is HomeFailure) {
            return Text(state.failure.errorMessage,style: StylesTextApp.textStyle32.copyWith(
              color: ColorApp.red100
            ),);
          }
          else{
            return const Center(
              child: CircularProgressIndicator(
                color: ColorApp.blue80,
              ),
            );
          }

        },
      ),
    );
  }
}

