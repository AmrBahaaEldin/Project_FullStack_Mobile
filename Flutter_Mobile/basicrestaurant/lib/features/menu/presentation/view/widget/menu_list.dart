import 'package:basicrestaurant/features/menu/data/model/menu_model_data.dart';
import 'package:basicrestaurant/features/menu/presentation/view/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 5.h),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: MenuModelData.dataMenu.length,
        itemBuilder: (context, index) =>
            MenuItem(data: MenuModelData.dataMenu[index]),
      ),
    );
  }
}
