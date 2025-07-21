import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../../core/constant/style_app.dart';
import '../../../../main_navigation/presentation/view/main_navigation.dart';
import '../../../data/models/transaction_item_model.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.data,
  });
  final TransactionItemModel data ;
  @override
  Widget build(BuildContext context) {
    return ListTile(


      contentPadding: EdgeInsets.zero,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.price, style: AppTextStyles.textStyle16.copyWith(
            color: ColorApp.red100,
          )),
          SizedBox(height: 12.h,),
          Text(data.datetime, style: AppTextStyles.textStyle13.copyWith(
            color: ColorApp.light20,
          ),),
        ],
      ),
      title: Text (data.title,style: AppTextStyles.textStyle16,),
      subtitle:  Text(data.subtitle,style:AppTextStyles.textStyle13.copyWith(color: ColorApp.light20),),
      leading: SvgPicture.asset(data.image),
    );
  }
}