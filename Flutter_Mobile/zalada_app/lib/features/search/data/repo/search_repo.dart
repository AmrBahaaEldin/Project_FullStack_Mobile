import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/product.dart';

abstract class SearchRepo {
  Future<Either<Failure, HomeProducesModel>> searchProdct(String value);
}
