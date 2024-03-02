import 'package:equatable/equatable.dart';

class MovieDiscoverEntity extends Equatable{
  MovieDiscoverEntity({this.results});

  List<MovieDiscoverDataEntity>? results;

  @override
  List<Object?> get props =>[results];
}

class MovieDiscoverDataEntity extends Equatable {
  MovieDiscoverDataEntity({
    this.backdropPath,
    this.id,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  String? backdropPath;

  num? id;

  String? posterPath;
  String? releaseDate;
  String? title;

  @override
  List<Object?> get props => [id];
}
