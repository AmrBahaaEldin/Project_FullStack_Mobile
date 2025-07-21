import 'package:expensetracker/features/auth/data/models/payment_method_data.dart';
import 'package:expensetracker/features/auth/presentation/view/widget/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridPaymentMethod extends StatelessWidget {
  const GridPaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: PaymentMethodData.paymentMethods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder: (context, index) {
        final paymentItem = PaymentMethodData.paymentMethods[index];
        return PaymentMethodItem(paymentItem: paymentItem);
      },
    );
  }
}
