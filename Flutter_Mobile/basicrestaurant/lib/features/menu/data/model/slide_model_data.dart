import 'package:basicrestaurant/core/constant/image_app.dart';
import 'package:basicrestaurant/features/menu/data/model/slide_model.dart';

class SlideModelData {
  SlideModelData._();

 static final List<SlideModel> items = [
  
   SlideModel(
     image:AppImage.slide1
   ),
   SlideModel(
    image:  AppImage.slide2,
   ),
   SlideModel(
    image:  AppImage.slide3,
   ),
];
}