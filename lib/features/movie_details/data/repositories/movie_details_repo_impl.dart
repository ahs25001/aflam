import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/movie_details/data/data_sources/movie_details_remot_ds/movie_details_ds.dart';
import 'package:aflame/features/movie_details/domain/entities/MoreLikeThisEntity.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/movie_details_repo.dart';
import '../data_sources/movie_details_local_ds/movie_details_local_ds.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl extends MovieDetailsRepo {
  MovieDetailsDs movieDetailsDs;
  MovieDetailsLocalDs movieDetailsLocalDs;

  MovieDetailsRepoImpl(this.movieDetailsDs, this.movieDetailsLocalDs);

  @override
  Future<Either<MovieDetailsEntity, Failures>> getDetails(String id) =>
      movieDetailsDs.getDetails(id);

  @override
  Future<Either<MoreLikeThisEntity, Failures>> getMoreLikeThis(String id) =>
      movieDetailsDs.getMoreLikeThis(id);

  @override
  Future<int> addToWishList(WishMovieModel wishMovieModel) =>
      movieDetailsLocalDs.addWishMovie(wishMovieModel);

  @override
  Future<int> deleteFromWishList(WishMovieModel wishMovieModel) =>
      movieDetailsLocalDs.deleteFromWishMovie(wishMovieModel);

  @override
  Future<List<WishMovieModel>> getWishMove() =>
      movieDetailsLocalDs.getWishMovie();
}
