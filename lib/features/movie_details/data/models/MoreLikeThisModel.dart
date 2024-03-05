import 'package:aflame/features/movie_details/domain/entities/MoreLikeThisEntity.dart';

class MoreLikeThisModel extends MoreLikeThisEntity {
  MoreLikeThisModel({
    this.page,
    super.results,
    this.totalPages,
    this.totalResults,
  });

  MoreLikeThisModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MoreLikeThisDataModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  num? page;
  num? totalPages;
  num? totalResults;
}

class MoreLikeThisDataModel extends MoreLikeThisDataEntity {
  MoreLikeThisDataModel({
    this.adult,
    super.backdropPath,
    this.genreIds,
    super.id,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.voteAverage,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.video,
    this.voteCount,
  });

  MoreLikeThisDataModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  List<num>? genreIds;

  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;

  bool? video;

  num? voteCount;
}
