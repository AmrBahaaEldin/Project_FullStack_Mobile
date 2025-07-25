import 'package:basicrestaurant/features/menu/data/model/menu_model.dart';

import '../../../../core/constant/image_app.dart';

class MenuModelData{
  MenuModelData._();

  static  List<MenuModel> dataMenu=[
    MenuModel(title: "Family Package", image: AppImage.familyPackage, price: "Rp320.000", subtitle: '1 large table 6 chair'),
    MenuModel(title: "Single Breakfast", image:  AppImage.familyBreakFast, price: "Rp70.000", subtitle: '1 table 1 chair'),
    MenuModel(title: "Date Package", image: AppImage.familyDate, price:' Rp135.000', subtitle: '1 table 2 chair'),
  ];
}

