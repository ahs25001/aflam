import 'package:aflame/features/movie_details/domain/entities/MoreLikeThisEntity.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../../../home/data/models/WishMovieModel.dart';

@injectable
abstract class MovieDetailsRepo {
  Future<Either<MovieDetailsEntity, Failures>> getDetails(String id);

  Future<Either<MoreLikeThisEntity, Failures>> getMoreLikeThis(String id);

  Future<List<WishMovieModel>> getWishMove();

  Future<int> addToWishList(WishMovieModel wishMovieModel);

  Future<int> deleteFromWishList(WishMovieModel wishMovieModel);
}
