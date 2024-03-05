import 'package:aflame/features/home/domain/entities/NewReleasesEntity.dart';
import 'package:aflame/features/movi_descover/domain/entities/MoveDiscoverEntity.dart';
import 'package:aflame/features/movie_details/data/models/MoreLikeThisModel.dart';
import 'package:aflame/features/movie_details/domain/entities/MoreLikeThisEntity.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';

import '../../domain/entities/PopularEntity.dart';
import '../../domain/entities/RecommendedEntity.dart';

class WishMovieModel {
  String? title;
  String? image;
  num? id;
  String? date;

  WishMovieModel({this.title, this.image, this.id, this.date});

  WishMovieModel.fromJson(Map<String, dynamic> map)
      : this(
            image: map["image"],
            date: map["date"],
            id: map["id"],
            title: map["title"]);

  WishMovieModel.fromRelease(NewReleasesDataEntity newReleasesDataModel)
      : this(
            image: newReleasesDataModel.backdropPath,
            date: newReleasesDataModel.releaseDate,
            id: newReleasesDataModel.id,
            title: newReleasesDataModel.title);

  WishMovieModel.fromRecommended(RecommendedDataEntity recommendedDataModel)
      : this(
            image: recommendedDataModel.backdropPath,
            date: recommendedDataModel.releaseDate,
            id: recommendedDataModel.id,
            title: recommendedDataModel.title);

  WishMovieModel.fromPopular(PopularDataEntity popularDataModel)
      : this(
            image: popularDataModel.backdropPath,
            date: popularDataModel.releaseDate,
            id: popularDataModel.id,
            title: popularDataModel.title);
  WishMovieModel.fromMoreLikeThis(MoreLikeThisDataEntity moreLikeThisDataEntity)
      : this(
            image: moreLikeThisDataEntity.backdropPath,
            date: moreLikeThisDataEntity.releaseDate,
            id: moreLikeThisDataEntity.id,
            title: moreLikeThisDataEntity.title);
  WishMovieModel.fromMovieDetails(MovieDetailsEntity movieDetailsEntity)
      : this(
            image: movieDetailsEntity.backdropPath,
            date: movieDetailsEntity.releaseDate,
            id: movieDetailsEntity.id,
            title: movieDetailsEntity.title);

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "image": image, "date": date};
  }
}
