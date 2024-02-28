import 'package:equatable/equatable.dart';

class RecommendedEntity extends Equatable {
  RecommendedEntity({
    this.results,
  });

  List<RecommendedDataEntity>? results;

  @override
  List<Object?> get props => [results];
}

class RecommendedDataEntity extends Equatable {
  RecommendedDataEntity(
      {this.backdropPath,
      this.id,
      this.posterPath,
      this.title,
      this.releaseDate,
      this.voteAverage});

  String? backdropPath;
  String? releaseDate;
  num? id;
  num? voteAverage;
  String? posterPath;

  String? title;

  @override
  List<Object?> get props => [id];
}
