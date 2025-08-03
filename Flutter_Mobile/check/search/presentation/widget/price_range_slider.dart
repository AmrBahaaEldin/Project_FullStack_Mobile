import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:e_commerce_app/core/widgets/custom_text.dart';
import 'package:e_commerce_app/core/widgets/custom_text_button.dart';
import 'package:e_commerce_app/features/search/logic/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    super.key,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double start = 20.0;
  double end = 500.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 308.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 66.67,
                height: 4,
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Filter',
                    color: AppColor.fontColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      start = 20;
                      end = 500;
                    });
                  },
                  child: CustomText(text: 'Reset',
                      color: AppColor.subFontColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Container(
              width: 375,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFEAEAEA),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            CustomText(text: 'Price Range',
                color: AppColor.fontColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,

            ),
            RangeSlider(
              values: RangeValues(start, end),
              onChanged: (RangeValues value) {
                setState(() {
                  start = value.start;
                  end = value.end;
                });
              },
              labels: RangeLabels("\$${start.toInt()}", "\$${end.toInt()}"),
              max: 700,
              min: 0,
              activeColor: AppColor.importFontColor,
              inactiveColor: Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(text: "\$${start.toInt()}",
                    color: AppColor.subFontColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,

                ),
                CustomText(text: "\$${end.toInt()}",
                    color: AppColor.subFontColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),

              ],
            ),
            SizedBox(height: 24.h),
            CustomTextButton(
              label: 'Apply filter',
              onTap: () {
                final searchCubit = context.read<SearchCubit>(); // Read it here
                searchCubit.filterProductsByPrice(start, end);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}