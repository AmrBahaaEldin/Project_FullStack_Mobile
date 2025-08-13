import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';

import '../../../../home/data/model/home_produces_model/product.dart';

class ProductAll extends StatelessWidget {
  const ProductAll({required this.data, super.key});
  final Product data;

  @override
  Widget build(BuildContext context) {
    final double afterdiscount = data.price! - data.discountPercentage!;
    return Container(
      width: 200.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            alignment: Alignment.center,
            errorWidget: (context, url, error) => Text(
              "invalid Error",
              style: StylesTextApp.textStyle14.copyWith(color: ColorApp.red60),
            ),
            imageUrl: data.images!.first,
            height: 100.h,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) => const Center(
              child: CircularProgressIndicator(color: ColorApp.dark50),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                data.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: StylesTextApp.textStyle14.copyWith(
                  color: ColorApp.dark100,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "\$${afterdiscount.toStringAsFixed(2)}",
                  style: StylesTextApp.textStyle16.copyWith(
                    color: ColorApp.blue100,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  '\$${data.price}',
                  style: StylesTextApp.textStyle12.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: ColorApp.dark25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
