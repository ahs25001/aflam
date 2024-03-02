import 'package:equatable/equatable.dart';

class SearchResultEntity extends Equatable{
  SearchResultEntity({
    this.results,
  });

  List<SearchResultDataEntity>? results;

  @override
  // TODO: implement props
  List<Object?> get props => [results];
}

class SearchResultDataEntity extends Equatable{
  SearchResultDataEntity({
    this.backdropPath,
    this.id,
    this.posterPath,
    this.title,
    this.releaseDate
  });

  String? backdropPath;
  int? id;
  String? posterPath;
  String? title;
  String? releaseDate;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
