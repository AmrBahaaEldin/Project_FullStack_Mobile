import 'package:basicrestaurant/features/menu/data/model/menu_model_data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/model/menu_model.dart';
import 'menu_item.dart';

class MenuBody extends StatelessWidget {
  const MenuBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) =>
                Image.asset("assets/images/$index.jpg"),
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: .7,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListView.builder(
            itemCount:MenuModelData.dataMenu.length ,
            itemBuilder: (context, index) => MenuItem(
            data:MenuModelData.dataMenu[index] ,
          ),
        ),
        ),
      ],
    );
  }
}
