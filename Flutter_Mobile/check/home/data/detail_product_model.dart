class DetailProductModel {
  String? title;
  double? price;
  String? image;
  Rating? rating;
  int? id;

  DetailProductModel(
      {this.image, this.rating, this.id, this.title, this.price});

  factory DetailProductModel.formJson(Map<String, dynamic> json) {
    return DetailProductModel(
        id: json['id'],
        rating: Rating(
            rate: json['rating']['rate'], count: json['rating']['count']),
        image: json['image'],
        title: json['title'],
        price: json['price'].toDouble());
  }
}

class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});
}

////////////////////////////////////////////////////////////////
class ViewProduct {
  String? image;
  String? title;
  double? price;

  ViewProduct({this.image, this.title, this.price});

  factory ViewProduct.fromJson(Map<String, dynamic> json) {
    return ViewProduct(
        image: json['image'],
        title: json['title'],
        price: (json['price'] as num).toDouble());
  }
}
