import 'package:equatable/equatable.dart';

class MoreLikeThisEntity extends Equatable{
  MoreLikeThisEntity({
    this.results,
  });

  List<MoreLikeThisDataEntity>? results;

  @override
  List<Object?> get props => [results];
}

class MoreLikeThisDataEntity extends Equatable{
  MoreLikeThisDataEntity({
    this.id,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  num? id;

  String? posterPath;
  String? releaseDate;
  String? title;

  num? voteAverage;

  @override
  List<Object?> get props => [id];
}
