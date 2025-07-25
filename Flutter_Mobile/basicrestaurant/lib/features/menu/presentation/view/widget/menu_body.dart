import 'package:basicrestaurant/core/constant/color_app.dart';
import 'package:basicrestaurant/core/constant/style_app.dart';
import 'package:basicrestaurant/features/menu/presentation/view/widget/menu_list.dart';
import 'package:basicrestaurant/features/menu/presentation/view/widget/slider_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SliderList()),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.fastfood,
                      color: AppColor.primary50,
                      size: 50.sp,
                    ),
                    SizedBox(height: 8.h),
                    const Text("Food", style: AppTextStyle.textStyle16),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.table_restaurant,
                      color: AppColor.second50,
                      size: 50.sp,
                    ),
                    SizedBox(height: 8.h),
                    const Text("Table", style: AppTextStyle.textStyle16),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.payment_rounded,
                      color: AppColor.accent50,
                      size: 50.sp,
                    ),
                    SizedBox(height: 8.h),
                    const Text("Payment", style: AppTextStyle.textStyle16),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.more_horiz_rounded,
                      color: AppColor.primary90,
                      size: 30.sp,
                    ),
                    SizedBox(height: 8.h),
                    const Text("More", style: AppTextStyle.textStyle16),
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
          const SliverToBoxAdapter(
            child: Text("Recommendation", style: AppTextStyle.textStyle24),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 18.h)),
          const SliverToBoxAdapter(child: MenuList()),
        ],
      ),
    );
  }
}
