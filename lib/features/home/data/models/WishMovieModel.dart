import 'package:aflame/features/home/domain/entities/NewReleasesEntity.dart';

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

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "image": image, "date": date};
  }
}
