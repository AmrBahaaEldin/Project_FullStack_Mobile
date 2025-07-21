import 'package:expensetracker/features/home/data/models/transaction_item_model.dart';

import '../../../../core/constant/image_app.dart';

class TransactionItemData{
  TransactionItemData._();
  static  List<TransactionItemModel> transactionItems=[
    const TransactionItemModel(
      image:ImageApp.shoppingSv,
      datetime: "03:30pm",
      price: "-\$5000",
      subtitle: "Buy some grocey",
      title: "Shopping",

    ),
    const TransactionItemModel(
      image:ImageApp.subscriptionsSv,
      datetime: "03:30pm",
      price: "-\$80",
      subtitle: "Disney +Annul",
      title: "subscriptions",),
    const TransactionItemModel(
      image:ImageApp.foodSv,
      datetime: "07:30Am",
      price: "-\$32",
      subtitle: "Buy a ramen",
      title: "food",),

  ];



}