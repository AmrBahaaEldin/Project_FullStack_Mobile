import 'package:flutter/cupertino.dart';

class CategoryItemModel {
  CategoryItemModel(
    this.text,
    this.image,
    this.background,
    this.backgroundImage,
    this.colorText,
    //this.onTap,
  );

  final String text;
  final String image;
  final Color background;
  final Color backgroundImage;
  final Color colorText;
  //final void Function()? onTap;
}
