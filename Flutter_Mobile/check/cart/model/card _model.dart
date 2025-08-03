

class CartModel {
  String? image;
  String? title;
  num? price;
  String? id;
  int? quantity;

  CartModel({this.image, this.title, this.price, this.id,this.quantity });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        image: json['image'],
        title: json['title'],
        price: (json['price']),
        id: json['id'],
      quantity: json['quantity'],
       );
  }
}


