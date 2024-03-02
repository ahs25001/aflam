import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movi_descover/data/data_sources/movie_discover_ds.dart';

import 'package:aflame/features/movi_descover/domain/entities/MoveDiscoverEntity.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/movie_discover_repo.dart';
@Injectable(as: MovieDiscoverRepo)
class MovieDiscoverRepoImpl extends MovieDiscoverRepo{
  MovieDiscoverDs movieDiscoverDs;

  MovieDiscoverRepoImpl(this.movieDiscoverDs);

  @override
  Future<Either<MovieDiscoverEntity, Failures>> getDiscover(String id) =>movieDiscoverDs.getDiscover(id);

}