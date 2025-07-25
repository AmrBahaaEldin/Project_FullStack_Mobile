import 'package:basicrestaurant/features/menu/data/model/menu_model.dart';

import '../../../../core/constant/image_app.dart';

class MenuModelData {
  MenuModelData._();

  static List<MenuModel> dataMenu = [
    MenuModel(
      title: "Burgers & Fast food",
      image: AppImage.burger,
      price: "Rp320.000",
      subtitle: '21 Restaurants',
    ),
    MenuModel(
      title: "Pasta & Casuals",
      image: AppImage.pasta,
      price: "Rp70.000",
      subtitle: '4 Restaurants',
    ),
    MenuModel(
      title: "Salads",
      image: AppImage.salads,
      price: ' Rp135.000',
      subtitle: '32 Restaurants',
    ),
  ];
}
