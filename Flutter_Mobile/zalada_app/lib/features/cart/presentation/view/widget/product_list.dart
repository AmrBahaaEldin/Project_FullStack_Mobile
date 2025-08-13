import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/cart/presentation/view/widget/product_all.dart';

import '../../../../home/data/model/home_produces_model/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({required this.products, super.key});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          ProductAll(data: products[index]),
      separatorBuilder: (context, index) {
        return SizedBox(width: 8.w);
      },
      itemCount: products.length,
    );
  }
}