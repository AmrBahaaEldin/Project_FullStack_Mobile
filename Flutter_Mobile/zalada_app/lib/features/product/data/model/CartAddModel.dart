/// id : 51
/// products : [{"id":94,"title":"Longines Master Collection","price":1499.99,"quantity":4,"total":5999.96,"discountPercentage":17.24,"discountedPrice":4966,"thumbnail":"https://cdn.dummyjson.com/product-images/mens-watches/longines-master-collection/thumbnail.webp"},{"id":144,"title":"Cricket Helmet","price":44.99,"quantity":4,"total":179.96,"discountPercentage":9.64,"discountedPrice":163,"thumbnail":"https://cdn.dummyjson.com/product-images/sports-accessories/cricket-helmet/thumbnail.webp"}]
/// total : 6179.92
/// discountedTotal : 5129
/// userId : 1
/// totalProducts : 2
/// totalQuantity : 8

class CartAddModel {
  CartAddModel({
      num? id, 
      List<Products>? products, 
      num? total, 
      num? discountedTotal, 
      num? userId, 
      num? totalProducts, 
      num? totalQuantity,}){
    _id = id;
    _products = products;
    _total = total;
    _discountedTotal = discountedTotal;
    _userId = userId;
    _totalProducts = totalProducts;
    _totalQuantity = totalQuantity;
}

  CartAddModel.fromJson(dynamic json) {
    _id = json['id'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
    _discountedTotal = json['discountedTotal'];
    _userId = json['userId'];
    _totalProducts = json['totalProducts'];
    _totalQuantity = json['totalQuantity'];
  }
  num? _id;
  List<Products>? _products;
  num? _total;
  num? _discountedTotal;
  num? _userId;
  num? _totalProducts;
  num? _totalQuantity;

  num? get id => _id;
  List<Products>? get products => _products;
  num? get total => _total;
  num? get discountedTotal => _discountedTotal;
  num? get userId => _userId;
  num? get totalProducts => _totalProducts;
  num? get totalQuantity => _totalQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['discountedTotal'] = _discountedTotal;
    map['userId'] = _userId;
    map['totalProducts'] = _totalProducts;
    map['totalQuantity'] = _totalQuantity;
    return map;
  }

}

/// id : 94
/// title : "Longines Master Collection"
/// price : 1499.99
/// quantity : 4
/// total : 5999.96
/// discountPercentage : 17.24
/// discountedPrice : 4966
/// thumbnail : "https://cdn.dummyjson.com/product-images/mens-watches/longines-master-collection/thumbnail.webp"

class Products {
  Products({
      num? id, 
      String? title, 
      num? price, 
      num? quantity, 
      num? total, 
      num? discountPercentage, 
      num? discountedPrice, 
      String? thumbnail,}){
    _id = id;
    _title = title;
    _price = price;
    _quantity = quantity;
    _total = total;
    _discountPercentage = discountPercentage;
    _discountedPrice = discountedPrice;
    _thumbnail = thumbnail;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _quantity = json['quantity'];
    _total = json['total'];
    _discountPercentage = json['discountPercentage'];
    _discountedPrice = json['discountedPrice'];
    _thumbnail = json['thumbnail'];
  }
  num? _id;
  String? _title;
  num? _price;
  num? _quantity;
  num? _total;
  num? _discountPercentage;
  num? _discountedPrice;
  String? _thumbnail;

  num? get id => _id;
  String? get title => _title;
  num? get price => _price;
  num? get quantity => _quantity;
  num? get total => _total;
  num? get discountPercentage => _discountPercentage;
  num? get discountedPrice => _discountedPrice;
  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['total'] = _total;
    map['discountPercentage'] = _discountPercentage;
    map['discountedPrice'] = _discountedPrice;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}