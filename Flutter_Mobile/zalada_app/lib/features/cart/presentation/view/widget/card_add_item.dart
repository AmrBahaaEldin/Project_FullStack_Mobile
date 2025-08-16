import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/style_app.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/counter_item_product.dart';
import 'package:zalada_app/features/product/data/model/CartAddModel.dart';

import '../../../data/model/user_cart_model/product.dart';

class CartAddItem extends StatelessWidget {
  const CartAddItem({required this.cart, super.key});
  final Product cart;

  @override
  Widget build(BuildContext context) {
    final afterDiscount = cart.price! - cart.discountPercentage!;
    return Row(
      children: [
        Expanded(
          child: CachedNetworkImage(
            alignment: Alignment.center,
            errorWidget: (context, url, error) => Text(
              "invalid Error",
              style: StylesTextApp.textStyle14.copyWith(color: ColorApp.red60),
            ),
            imageUrl: cart.thumbnail!,
            height: 100.h,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) => const Center(
              child: CircularProgressIndicator(color: ColorApp.dark50),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 171.w,
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                cart.title!,
                style: StylesTextApp.textStyle14,
              ),
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  cart.price!.toString(),
                  style: StylesTextApp.textStyle14.copyWith(
                    color: ColorApp.blue80,
                  ),
                ),
                SizedBox(width: 8.h),
                Text(
                  afterDiscount.toStringAsFixed(2),
                  style: StylesTextApp.textStyle12.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: ColorApp.dark25,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const CounterItemProduct(icon: Icons.remove),
                SizedBox(width: 15.w),
                const Text("1", style: StylesTextApp.textStyle14),
                SizedBox(width: 15.w),
                const CounterItemProduct(icon: Icons.add),
                SizedBox(width: 40.w),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: ColorApp.red80),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
