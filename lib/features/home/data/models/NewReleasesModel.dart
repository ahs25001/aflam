import 'package:aflame/features/home/domain/entities/NewReleasesEntity.dart';

class NewReleasesModel extends NewReleasesEntity {
  NewReleasesModel({
    this.dates,
    this.page,
    super.results,
    this.totalPages,
    this.totalResults,
  });

  NewReleasesModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(NewReleasesDataModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Dates? dates;
  int? page;
  int? totalPages;
  int? totalResults;
}

class NewReleasesDataModel extends NewReleasesDataEntity {
  NewReleasesDataModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    super.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    super.posterPath,
    super.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  NewReleasesDataModel.fromJson(dynamic json) {
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
  String? backdropPath;
  List<int>? genreIds;

  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  String? maximum;
  String? minimum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum'] = maximum;
    map['minimum'] = minimum;
    return map;
  }
}
