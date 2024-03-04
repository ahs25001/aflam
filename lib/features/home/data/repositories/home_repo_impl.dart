import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/home/data/data_sources/local_ds/home_local_ds.dart';
import 'package:aflame/features/home/data/data_sources/remot_ds/home_remote_ds.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/home/domain/entities/CategoryEntity.dart';
import 'package:aflame/features/home/domain/entities/NewReleasesEntity.dart';
import 'package:aflame/features/home/domain/entities/PopularEntity.dart';
import 'package:aflame/features/home/domain/entities/RecommendedEntity.dart';
import 'package:aflame/features/home/domain/entities/SearchResultEntity.dart';
import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  HomeRemoteDs homeRemoteDs;
  HomeLocalDs homeLocalDs;

  HomeRepoImpl(this.homeRemoteDs, this.homeLocalDs);

  @override
  Future<Either<PopularEntity?, Failures>> getPopular() =>
      homeRemoteDs.getPopular();

  @override
  Future<Either<NewReleasesEntity?, Failures>> getNewReleases() =>
      homeRemoteDs.getNewReleases();

  @override
  Future<Either<RecommendedEntity?, Failures>> getRecommended() =>
      homeRemoteDs.getRecommended();

  @override
  Future<Either<SearchResultEntity?, Failures>> search(String key) =>
      homeRemoteDs.search(key);

  @override
  Future<Either<CategoryEntity?, Failures>> getCategories() =>
      homeRemoteDs.getCategories();

  @override
  Future<List<WishMovieModel>> getWishMove() =>
      homeLocalDs.getWishMovieFromSql();

  @override
  Future<int> addToWishList(WishMovieModel wishMovieEntity) =>
      homeLocalDs.addWishMovieToSql(wishMovieEntity);

  @override
  Future<int> deleteFromWishList(WishMovieModel wishMovieModel) =>
      homeLocalDs.deleteFromWishMovieInSql(wishMovieModel);
}
