
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/product.dart';
import 'package:zalada_app/features/product/presentation/view/widget/product_related_list.dart';

class RelatedProduce extends StatelessWidget {
  const RelatedProduce({required this.products, super.key});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) =>
          ProductRelatedList(data: products[index]),
      separatorBuilder: (context, index) {
        return SizedBox(width: 8.w);
      },
      itemCount: products.length,
    );
  }
}

