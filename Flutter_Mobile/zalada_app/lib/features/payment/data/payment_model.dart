import 'package:e_commerce_app/core/constants/app_image.dart';

class PaymentModel {
  final String image;
  final String title;
  final String subtitle;
  PaymentModel({required this.subtitle,required this.image, required this.title});
}

List<PaymentModel> paymentModel = [
  PaymentModel(
    image: AppImage.card1,
    title: "Mastercard",
    subtitle: "**** **** **** 1234",

  ),
  PaymentModel(
    image: AppImage.card2,
    title: "Visa",
    subtitle: "**** **** **** 4050",
  ),
  PaymentModel(
    image: AppImage.card3,
    title: "Paypal",
    subtitle: "**** **** **** 2030",
  ),
];