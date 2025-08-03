import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';

import 'package:e_commerce_app/features/search/logic/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/widget/categories_gird_view.dart';
import 'package:e_commerce_app/features/search/presentation/widget/custom_Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SearchCubit()..getProducts(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
            child: Column(
              children: [
                CustomSearch(),
                BlocBuilder<SearchCubit,SearchState>(builder:(context, state) {
                  if (state is SearchLoading) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                  if (state is SearchSuccess &&
                      state.searchedProducts.isEmpty) {
                     return Center(
                      child: CustomText(text: 'No products found',
                          color: AppColor.fontColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp),);
                  }
                  if (state is SearchSuccess) {
                    return CategoriesGridView(
                      products: state.searchedProducts, // ✅ عرض المنتجات هنا
                    );
                  }

                  return Container();

                }, )

              ],
            ),
          ),
        ),
      ),
    );
  }
}


