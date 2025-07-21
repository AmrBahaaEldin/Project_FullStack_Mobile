import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color_app.dart';
import '../../../../main_navigation/data/check_date_balance.dart';

class SegmentButton extends StatelessWidget {
  const SegmentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      showSelectedIcon: false,

      segments: [
        ButtonSegment(
            value: CheckDateBalance.selectDateCheck,
            label: Text(CheckDateBalance.selectDateCheck)),
        ButtonSegment(
            value: CheckDateBalance.selectWeekCheck,
            label: Text(CheckDateBalance.selectWeekCheck)),
        ButtonSegment(
            value: CheckDateBalance.selectMonthCheck,
            label: Text(CheckDateBalance.selectMonthCheck)),
        ButtonSegment(
            value: CheckDateBalance.selectYearCheck,
            label: Text(CheckDateBalance.selectYearCheck)),
      ],
      selected: {CheckDateBalance.selectDateCheck},
      onSelectionChanged: (newSelection) {
        debugPrint(newSelection.first);
        // هنا تقدر تحدث الحالة أو Bloc حسب الاختيار
      },

      // 🎨 تنسيق الأزرار
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorApp.yellow20; // الخلفية المختارة
          }
          return Colors.transparent; // الخلفية العادية
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorApp.yellow100; // لون النص لو مختار
          }
          return ColorApp.light20; // لون النص العادي
        }),
        side: WidgetStateProperty.all(BorderSide.none),
        shape: WidgetStateProperty.all(RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(28.r),
        )),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}