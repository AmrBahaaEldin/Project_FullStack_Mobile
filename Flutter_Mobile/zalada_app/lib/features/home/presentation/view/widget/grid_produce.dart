import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/product.dart';
import 'package:zalada_app/features/home/presentation/view/widget/item_produces.dart';

class GridProduce extends StatelessWidget {
  const GridProduce({required this.count, required this.data, super.key});
  final int count;
  final List<Product> data;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: count,
        (context, index) => ItemProduces(data: data[index]),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1, //width/height
        crossAxisCount: 2,
        mainAxisSpacing: 20.h, //between 2 row axis y
        crossAxisSpacing: 10.w, //between 2 column axis x ),
      ),
    );
  }
}
