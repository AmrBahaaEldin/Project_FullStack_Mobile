import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/features/home/data/model/hotdeal/home_hot_deal_model.dart';

class BannerHotDeal extends StatelessWidget {
  const BannerHotDeal({required this.data, super.key});
  final HomeHotDealModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.r),

        child: Image.asset(height: 300.h, data.image, fit: BoxFit.fill),
      ),
    );
  }
}
