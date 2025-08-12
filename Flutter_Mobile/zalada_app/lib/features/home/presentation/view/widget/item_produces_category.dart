import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../data/model/home_produces_model/product.dart';

class ItemProducesCategory extends StatelessWidget {
  const ItemProducesCategory({required this.data, super.key});
  final Product data;

  @override
  Widget build(BuildContext context) {
    final double afterdiscount = data.price! - data.discountPercentage!;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40.r)),
        color: ColorApp.green20,
      ),
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Text(
                "invalid Error",
                style: StylesTextApp.textStyle14.copyWith(
                  color: ColorApp.red60,
                ),
              ),
              imageUrl: data.images!.first,
              height: 50.h,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(
                    child: CircularProgressIndicator(color: ColorApp.dark50),
                  ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            data.title!,
            style: StylesTextApp.textStyle14.copyWith(color: ColorApp.dark100),
          ),
          SizedBox(height: 4.h),
          Wrap(
            children: [
              Text(
                "\$${afterdiscount.toStringAsFixed(2)}",
                style: StylesTextApp.textStyle16.copyWith(
                  color: ColorApp.blue100,
                ),
              ),
              const SizedBox(width: 10),
       if (data.discountPercentage!=null  )   Text(
                "\$${data.price}",
                style: StylesTextApp.textStyle16.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: ColorApp.dark25,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          if (data.discountPercentage!=null  )  Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: ColorApp.yellow100,
            ),
            child: Text(
              "NEW - ${data.discountPercentage}% OFF",
              style: StylesTextApp.textStyle12.copyWith(
                color: ColorApp.light80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
