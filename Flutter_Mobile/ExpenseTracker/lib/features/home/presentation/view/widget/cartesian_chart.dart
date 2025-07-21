import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../core/constant/color_app.dart';

class CartesianChart extends StatelessWidget {
  const CartesianChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: const CategoryAxis(
          isVisible: false,
        ),
        primaryYAxis: const NumericAxis(
          isVisible: false,
        ),
        series: <CartesianSeries>[
          SplineAreaSeries<int, int>(
            color: Colors.transparent, //
            dataSource: const [20, 4, -5, 15, 10, 80, 30, -1],
            xValueMapper: (value, index) => index,
            yValueMapper: (value, index) => value,
            borderColor: ColorApp.violet80,
            borderWidth: 8,
          )
        ],
      ),
    );
  }
}