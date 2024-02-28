import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable{
  MovieDetailsEntity({
    this.backdropPath,
    this.genres,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  String? backdropPath;

  List<GenresEntity>? genres;

  int? id;

  String? overview;

  String? posterPath;

  String? releaseDate;

  String? title;
  num? voteAverage;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class GenresEntity extends Equatable{
  GenresEntity({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
