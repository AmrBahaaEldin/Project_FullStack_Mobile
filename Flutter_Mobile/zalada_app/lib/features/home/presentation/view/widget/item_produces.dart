
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../data/model/home_produces_model/product.dart';

class ItemProduces extends StatelessWidget {
  const ItemProduces({required this.data, super.key});
  final Product data;
  @override
  Widget build(BuildContext context) {
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
              errorWidget: (context, url, error) => Text("invalid Error",style: StylesTextApp.textStyle14.copyWith(
                color: ColorApp.red60,
              ),),
              imageUrl: data.images!.first,
              height: 50.h,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, progress) => const CircularProgressIndicator(
                color: ColorApp.blue60,
              ),),
          ),
          SizedBox(height: 4.h),
          Text(data.title!,
            style: StylesTextApp.textStyle14.copyWith(color: ColorApp.dark100),
          ),
          SizedBox(height: 4.h),
          Wrap(
            children: [
              Text(
                "\$${data.discountPercentage}",
                style: StylesTextApp.textStyle16.copyWith(
                  color: ColorApp.blue100,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "\$${data.price}",
                style: StylesTextApp.textStyle16.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: ColorApp.dark25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}