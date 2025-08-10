import 'package:fpdart/fpdart.dart';
import 'package:zalada_app/core/utils/errors/failure.dart';
import 'package:zalada_app/features/profile/data/model/profile_show.dart';

abstract class RepoProfile {
  Future<Either<Failure, ProfileShow>> getProfile(String author);
}
