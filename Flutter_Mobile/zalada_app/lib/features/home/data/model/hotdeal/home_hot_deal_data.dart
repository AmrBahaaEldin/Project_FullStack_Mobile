import 'package:zalada_app/core/constant/image_app.dart';
import 'package:zalada_app/features/home/data/model/hotdeal/home_hot_deal_model.dart';

class HomeHotDealData {
  HomeHotDealData._();

  static final List<HomeHotDealModel> data = [
    HomeHotDealModel(image: ImageApp.banner1),
    HomeHotDealModel(image: ImageApp.banner2),
    HomeHotDealModel(image: ImageApp.banner3),
    HomeHotDealModel(image: ImageApp.banner4),
  ];
}
