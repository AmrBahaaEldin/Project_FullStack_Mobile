import 'package:basicrestaurant/core/constant/color_app.dart';
import 'package:basicrestaurant/features/menu/data/model/menu_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/style_app.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.data});
  final MenuModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100.h,
          width: 340.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(data.image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 8.h),
        Text(data.title, style: AppTextStyle.textStyle16),
        Text(
          data.subtitle,
          style: AppTextStyle.textStyle12.copyWith(color: AppColor.gray),
        ),
        Text(data.price, style: AppTextStyle.textStyle14),
      ],
    );
  }
}
