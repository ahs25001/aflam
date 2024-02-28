import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movie_details/data/data_sources/movie_details_ds.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/movie_details_repo.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl extends MovieDetailsRepo {
  MovieDetailsDs movieDetailsDs;

  MovieDetailsRepoImpl(this.movieDetailsDs);

  @override
  Future<Either<MovieDetailsEntity, Failures>> getDetails(String id) =>
      movieDetailsDs.getDetails(id);
}
