import 'package:aflame/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/MoreLikeThisEntity.dart';

@injectable
class GetMoreLikeThisUseCase {
  MovieDetailsRepo movieDetailsRepo;

  GetMoreLikeThisUseCase(this.movieDetailsRepo);

  Future<Either<MoreLikeThisEntity, Failures>> call(String id) =>
      movieDetailsRepo.getMoreLikeThis(id);
}
