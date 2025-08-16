import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/card_add_item.dart';

import '../../../../product/data/model/CartAddModel.dart';
import '../../../data/model/user_cart_model/product.dart';

class CartListProduct extends StatelessWidget {
  const CartListProduct({required this.cart, super.key, this.itemCount});
 final int? itemCount;
 final List<Product> cart;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: itemCount,
      itemBuilder: (context, index) =>
          CartAddItem(cart: cart[index]),
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
    );
  }
}