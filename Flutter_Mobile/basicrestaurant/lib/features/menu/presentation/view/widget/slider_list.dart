import 'package:basicrestaurant/features/menu/data/model/slide_model_data.dart';
import 'package:basicrestaurant/features/menu/presentation/view/widget/slider_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderList extends StatelessWidget {
  const SliderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: SlideModelData.items.length,
      itemBuilder: (context, index, realIndex) =>
          SliderItem(slideModel: SlideModelData.items[index]),
      options: CarouselOptions(
        scrollPhysics: const NeverScrollableScrollPhysics(),
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 100),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: .7,
      ),
    );
  }
}

