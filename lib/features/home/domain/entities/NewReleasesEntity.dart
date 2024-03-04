import 'package:equatable/equatable.dart';

class NewReleasesEntity extends Equatable {
  NewReleasesEntity({this.results});

  List<NewReleasesDataEntity>? results;

  @override
  // TODO: implement props
  List<Object?> get props => [results];
}

class NewReleasesDataEntity extends Equatable{
  NewReleasesDataEntity({
    this.id,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.backdropPath,
  });

  num? id;
  String? posterPath;
  String? releaseDate;
  String? title;
  String? backdropPath;
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
