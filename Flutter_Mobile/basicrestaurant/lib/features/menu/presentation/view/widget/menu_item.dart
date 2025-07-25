import 'package:basicrestaurant/core/constant/color_app.dart';
import 'package:basicrestaurant/features/menu/data/model/menu_model.dart';
import 'package:basicrestaurant/features/menu/data/model/menu_model_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constant/image_app.dart';
import '../../../../../core/constant/style_app.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key ,required this.data});
  final MenuModel data ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppImage.familyPackage),
        SizedBox(height: 8.h,),
        Text(data.title,style: AppTextStyle.textStyle16,),
        Text(data.subtitle,style: AppTextStyle.textStyle16.copyWith(
          color: AppColor.gray,
        ),),



      ],
    );
  }
}
