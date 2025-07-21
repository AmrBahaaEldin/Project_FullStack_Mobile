import 'package:expensetracker/features/home/presentation/view/widget/transaction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main_navigation/presentation/view/main_navigation.dart';
import '../../../data/models/transaction_item_data.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 8.h,
      ),
      itemCount: TransactionItemData.transactionItems.length,
      itemBuilder: (context, index) {
        final data = TransactionItemData.transactionItems[index];
        return  TransactionItem(
          data: data,
        );
      },

    );
  }
}