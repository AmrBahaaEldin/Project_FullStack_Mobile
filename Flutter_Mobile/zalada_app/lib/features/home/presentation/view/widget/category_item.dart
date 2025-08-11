import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/home/data/model/category/category_item_data.dart';
import 'package:zalada_app/features/home/data/model/category/category_item_model.dart';
import '../../../../../core/constant/style_app.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.data, super.key});

  final CategoryItemModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: data.background,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: data.backgroundImage,
            ),
            child: Image.asset(data.image),
          ),
          SizedBox(width: 8.w),
          Text(
            data.text,
            style: StylesTextApp.textStyle14.copyWith(color: data.colorText),
          ),
        ],
      ),
    );
  }
}
