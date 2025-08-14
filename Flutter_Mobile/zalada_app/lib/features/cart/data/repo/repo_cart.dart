import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/cart/data/model/user_cart_model/user_cart_model.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';
import 'package:zalada_app/features/product/data/model/CartAddModel.dart';
import 'package:zalada_app/features/product/data/model/cart_add_input_model.dart';

abstract class RepoCart {
  Future<Either<Failure, UserCartModel>> fetchCartUser(int userId);
  Future<Either<Failure, HomeProducesModel>> fetchAllProducts();
  Future<Either<Failure,CartAddModel>> fetchAddCart(CartAddInputModel cartAddInputModel);
}
