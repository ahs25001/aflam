import '../../domain/entities/CategoryEntity.dart';

class CategoryModel extends CategoryEntity{
  CategoryModel({
      super.genres,});

  CategoryModel.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresCategoryModel.fromJson(v));
      });
    }
  }



}

class GenresCategoryModel extends GenresCategoryEntity {
  GenresCategoryModel({
      super.id,
      super.name,});

  GenresCategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }




}