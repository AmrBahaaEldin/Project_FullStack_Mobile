class CartAddInputModel{
  final int userId;
  final List<ProductsAddModel> products;

  CartAddInputModel({required this.userId, required this.products});

  Map<String, dynamic> toJson() {
    return { "userId": userId,

      "products": products.map((p) => p.toJson()).toList(),
    };
  }
}

class ProductsAddModel {
  final int idProduct;
  final int quantityProduct;

  ProductsAddModel({required this.idProduct, required this.quantityProduct});

  Map<String, dynamic> toJson() {
    return {
      "id": idProduct,
      "quantity": quantityProduct,
    };
  }
}