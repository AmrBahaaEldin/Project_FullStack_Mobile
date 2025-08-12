import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/router_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/core/widgets/custom_failure_widget.dart';
import 'package:zalada_app/core/widgets/custom_loading_widget.dart';
import 'package:zalada_app/core/widgets/toast_message_app.dart';
import 'package:zalada_app/features/home/data/model/category/category_item_data.dart';
import 'package:zalada_app/features/home/data/model/hotdeal/home_hot_deal_data.dart';
import 'package:zalada_app/features/home/manager/logic/produce/home_cubit.dart';
import 'package:zalada_app/features/home/manager/logic/produce/home_state.dart';
import 'package:zalada_app/features/home/manager/logic/slider_banner/cubit/slider_banner_cubit.dart';
import 'package:zalada_app/features/home/presentation/view/widget/banner_hot_deal.dart';
import 'package:zalada_app/features/home/presentation/view/widget/category_item.dart';
import 'package:zalada_app/features/home/presentation/view/widget/grid_produce.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Text("Hot deals🔥", style: StylesTextApp.textStyle18),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: CarouselSlider.builder(
              itemCount: HomeHotDealData.data.length,
              itemBuilder: (context, index, realIndex) =>
                  BannerHotDeal(data: HomeHotDealData.data[index]),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  context.read<SliderBannerCubit>().changePage(index);
                },
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: const Duration(milliseconds: 300),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          BlocBuilder<SliderBannerCubit, int>(
            builder: (context, bannerIndex) {
              return SliverToBoxAdapter(
                child: Center(
                  child: AnimatedSmoothIndicator(
                    curve: Curves.bounceInOut,
                    activeIndex: bannerIndex,
                    count: HomeHotDealData.data.length,
                    axisDirection: Axis.horizontal,
                    effect: const WormEffect(
                      type: WormType.thinUnderground,
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: ColorApp.blue100,
                      dotColor: ColorApp.dark25,
                    ),
                  ),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(
            child: Text("Categories", style: StylesTextApp.textStyle18),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60.h,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<HomeCubit>().fetchProduceCategory(
                      CategoryItemData.dataItem[index].text,
                    );
                  },
                  child: CategoryItem(data: CategoryItemData.dataItem[index]),
                ),
                separatorBuilder: (context, index) {
                  return SizedBox(width: 8.w);
                },
                itemCount: CategoryItemData.dataItem.length,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 15.h)),
          BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeFailure) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.red100,
                  message: state.failure.errorMessage,
                );
              }
              if (state is HomeLoaded) {
                ToastMessage.showToast(
                  backGroundColor: ColorApp.green100,
                  message: "Scuceess fetch data ",
                );
              }
            },
            builder: (context, state) {
              if (state is HomeLoaded &&
                  state.homeProduceModel.products!.isNotEmpty) {
                return GridProduce(
               
                  count: state.homeProduceModel.products!.length,
                  data: state.homeProduceModel.products!,
                );
              } else if (state is HomeFailure) {
                return SliverToBoxAdapter(
                  child: CustomFailureWidget(text: state.failure.errorMessage),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: CustomLoadingWidget(showLoading: true),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
