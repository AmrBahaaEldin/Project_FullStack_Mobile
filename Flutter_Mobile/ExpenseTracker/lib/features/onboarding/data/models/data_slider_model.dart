import 'package:expensetracker/core/constant/image_app.dart';
import 'package:expensetracker/features/onboarding/data/models/slider_model.dart';
class DataSliderModel {
  DataSliderModel._();

  static final List<SliderModel> dataSlider = [
    const SliderModel(
        image: ImageApp.gainControlMoneySV,
        titleText: "Gain total control\nof your money",
        descriptionText:
            "Become your own money manager\nand make every cent count"),
    const SliderModel(
      image: ImageApp.knowMoneySV,
      titleText: "Know where your money goes",
      descriptionText:
          "Track your transaction easily,\nwith categories and financial report ",
    ),
    const SliderModel(
      image: ImageApp.planningAheadSV,
      titleText: "Planning ahead",
      descriptionText:
          "Track your transaction easily,with categories and financial report ",
    ),
  ];
}
