import 'package:equatable/equatable.dart';

class PopularEntity extends Equatable{
  PopularEntity({
      this.page, 
      this.results, 
      this.totalPages, 
      this.totalResults,});

  num? page;
  List<PopularDataEntity>? results;
  num? totalPages;
  num? totalResults;


  @override
  // TODO: implement props
  List<Object?> get props => [page,results,totalPages,totalResults];



}

class PopularDataEntity extends Equatable {
  PopularDataEntity({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;



  @override
  // TODO: implement props
  List<Object?> get props => [id];

}