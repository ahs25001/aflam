import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
  CategoryEntity({
      this.genres,});

  List<GenresCategoryEntity>? genres;

  @override
  List<Object?> get props =>[genres];


}

class GenresCategoryEntity extends Equatable {
  GenresCategoryEntity({
      this.id, 
      this.name,});

  num? id;
  String? name;

  @override
  List<Object?> get props => [id];


}