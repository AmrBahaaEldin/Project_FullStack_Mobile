import 'package:e_commerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    super.key,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double start = 20.0;
  double end = 500.0;
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: RangeValues(start, end),
      onChanged: (RangeValues value) {
        setState(() {
          start = value.start;
          end = value.end;
        });
      },
      labels: RangeLabels(start.toString(), end.toString()),
      max: 1000,
      min: 10.0,
      activeColor: AppColor.fontLabelColor,
    );
  }
}