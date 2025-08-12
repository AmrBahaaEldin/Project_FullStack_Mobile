import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/image_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_loading_widget.dart';
import 'package:zalada_app/core/widgets/custom_text_field_app.dart';
import 'package:zalada_app/features/home/presentation/view/widget/grid_produce.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_cubit.dart';
import 'package:zalada_app/features/search/manager/logic/cubit/search_state.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "Search",
              style: StylesTextApp.textStyle24.copyWith(color: ColorApp.dark50),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: CustomTextFieldApp(
              onChanged: (p0) {
                context.read<SearchCubit>().search(p0);
              },
              colorHint: ColorApp.dark50,
              colorEnableBorder: ColorApp.dark25,
              colorFocusedBorder: ColorApp.blue80,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess && state.data.products!.isNotEmpty) {
                return GridProduce(
                  count: state.data.products!.length,
                  data: state.data.products!,
                );
              } else if (state is SearchFailure) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      state.failure.errorMessage,
                      style: StylesTextApp.textStyle18.copyWith(
                        color: ColorApp.red100,
                      ),
                    ),
                  ),
                );
              } else if (state is SearchLoaing) {
                return const SliverToBoxAdapter(
                  child: CustomLoadingWidget(showLoading: false),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Image.asset(ImageApp.search, height: 400.h),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
