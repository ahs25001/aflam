import 'package:aflame/features/home/domain/entities/SearchResultEntity.dart';

class SearchResultModel extends SearchResultEntity {
  SearchResultModel({
      this.page, 
      super.results,
      this.totalPages, 
      this.totalResults,});

  SearchResultModel.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(SearchResultDataModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  num? page;
  num? totalPages;
  num? totalResults;


}

class SearchResultDataModel extends SearchResultDataEntity {
  SearchResultDataModel({
      this.adult, 
      super.backdropPath,
      this.genreIds, 
      super.id,
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      super.posterPath,
      super.releaseDate,
      super.title,
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  SearchResultDataModel.fromJson(dynamic json) {
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
  num? voteAverage;
  num? voteCount;


}