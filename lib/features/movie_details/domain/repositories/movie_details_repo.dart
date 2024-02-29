import 'package:aflame/features/movie_details/domain/entities/MoreLikeThisEntity.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';

@injectable
abstract class MovieDetailsRepo {
  Future<Either<MovieDetailsEntity, Failures>> getDetails(String id);

  Future<Either<MoreLikeThisEntity, Failures>> getMoreLikeThis(String id);
}
