import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/home/data/model/home_produces_model/home_produces_model.dart';

abstract class RepoHome {
  Future<Either<Failure, HomeProducesModel>> fetchProduces({
    required String categoryProduce,
  });
}
