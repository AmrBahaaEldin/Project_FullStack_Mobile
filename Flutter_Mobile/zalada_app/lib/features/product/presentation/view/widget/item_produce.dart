import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/product.dart';

class ItemProduce extends StatelessWidget {
  const ItemProduce({
    required this.data,
    required this.afterdiscount,
    super.key,
  });

  final Product data;
  final double afterdiscount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          data.title!,
          style: StylesTextApp.textStyle24.copyWith(color: ColorApp.dark100),
        ),
        SizedBox(height: 8.h),
        Wrap(
          alignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "\$${afterdiscount.toStringAsFixed(2)}",
              style: StylesTextApp.textStyle18.copyWith(
                color: ColorApp.blue100,
              ),
            ),
            SizedBox(width: 2.w),

            Text(
              "\$${data.price}",
              style: StylesTextApp.textStyle12.copyWith(
                decoration: TextDecoration.lineThrough,
                color: ColorApp.dark25,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        CachedNetworkImage(
          alignment: Alignment.center,
          errorWidget: (context, url, error) => Text(
            "invalid Error",
            style: StylesTextApp.textStyle14.copyWith(color: ColorApp.red60),
          ),
          imageUrl: data.images!.first,
          height: 250.h,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, progress) => const Center(
            child: CircularProgressIndicator(color: ColorApp.dark50),
          ),
        ),
      ],
    );
  }
}
