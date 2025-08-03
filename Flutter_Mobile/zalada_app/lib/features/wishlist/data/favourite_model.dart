class FavouriteModel {
  String? image;
  String? title;
  num? price;
  String? id;
  int? quantity;

  FavouriteModel({this.image, this.title, this.price, this.id,this.quantity });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      image: json['image'],
      title: json['title'],
      price: (json['price']),
      id: json['id'],
      quantity: json['quantity'],
    );
  }
}