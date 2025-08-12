import 'package:zalada_app/core/constant/color_app.dart';
import 'package:zalada_app/core/constant/image_app.dart';
import 'package:zalada_app/features/home/data/model/category/category_item_model.dart';

class CategoryItemData {
  CategoryItemData._();

  static List<CategoryItemModel> dataItem = [
    CategoryItemModel(
      "tops",
      ImageApp.topspng,
      ColorApp.blue80,
      ColorApp.light100,
      ColorApp.light100,
    ),
    CategoryItemModel(
      "laptops",
      ImageApp.laptopPng,
      ColorApp.blue80,
      ColorApp.light100,
      ColorApp.light100,
    ),
    CategoryItemModel(
      "sports-accessories",
      ImageApp.accessoriesPng,
      ColorApp.blue80,
      ColorApp.light100,
      ColorApp.light100,
    ),
    CategoryItemModel(
      "smartphones",
      ImageApp.smartphone,
      ColorApp.blue80,
      ColorApp.light100,
      ColorApp.light100,
    ),
    CategoryItemModel(
      "skin-care",
      ImageApp.skincare,
      ColorApp.blue80,
      ColorApp.light100,
      ColorApp.light100,
    ),
  ];
}
