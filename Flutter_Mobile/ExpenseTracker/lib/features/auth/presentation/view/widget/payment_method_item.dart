import 'package:expensetracker/core/constant/color_app.dart';
import 'package:expensetracker/features/auth/data/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.paymentItem,
  });

  final PaymentMethodModel paymentItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ColorApp.violet20,
      ),
      child: SvgPicture.asset(
        paymentItem.image,
        fit: BoxFit.contain,
      ),
    );
  }
}
