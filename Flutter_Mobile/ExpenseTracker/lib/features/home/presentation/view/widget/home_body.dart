import 'package:expensetracker/features/home/presentation/view/widget/segment_button.dart';
import 'package:expensetracker/features/home/presentation/view/widget/transaction_list.dart';
import 'package:expensetracker/features/home/presentation/view/widget/type_payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Placeholder, StatelessWidget, BuildContext, Widget, CustomScrollView, Center, Text, SizedBox, Row, MainAxisAlignment, WidgetStateProperty, ButtonStyle, TextButton, Column, SliverToBoxAdapter, BouncingScrollPhysics;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/style_app.dart';
import 'cartesian_chart.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      physics:const ScrollPhysics(parent: BouncingScrollPhysics()),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Account Balance",
                    style: AppTextStyles.textStyle14.copyWith(
                      color: ColorApp.light20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                const Center(
                  child: Text("\$9400", style: AppTextStyles.textStyle32),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    const TypePayment(),
                    SizedBox(
                      width: 20.w,
                    ),
                    const TypePayment(),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                const CartesianChart(),
                const SegmentButton(),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Recent Transactions",
                        style: AppTextStyles.textStyle18),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(ColorApp.violet20),
                      ),
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: AppTextStyles.textStyle14
                            .copyWith(color: ColorApp.violet100),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),

              ],
            ),
          ),
        ),
        const TransactionList(),

      ],

    );
  }
}
