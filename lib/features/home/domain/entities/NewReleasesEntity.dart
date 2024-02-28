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
  });

  num? id;
  String? posterPath;
  String? releaseDate;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
