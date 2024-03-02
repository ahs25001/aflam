import 'package:aflame/features/movi_descover/domain/repositories/movie_discover_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/MoveDiscoverEntity.dart';

@injectable
class GetMovieDiscoverUseCase {
  MovieDiscoverRepo movieDiscoverRepo;

  GetMovieDiscoverUseCase(this.movieDiscoverRepo);

  Future<Either<MovieDiscoverEntity, Failures>> call(String id)  =>
      movieDiscoverRepo.getDiscover(id);
}
