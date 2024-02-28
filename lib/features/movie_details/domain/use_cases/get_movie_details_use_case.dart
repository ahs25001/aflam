import 'package:aflame/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/MovieDetailsEntity.dart';

@injectable
class GetMovieDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;

  GetMovieDetailsUseCase(this.movieDetailsRepo);

  Future<Either<MovieDetailsEntity, Failures>> call(String id) =>
      movieDetailsRepo.getDetails(id);
}
