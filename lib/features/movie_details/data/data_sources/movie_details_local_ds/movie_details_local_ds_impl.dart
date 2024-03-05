import 'package:aflame/core/sql/sql_manager.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:injectable/injectable.dart';

import 'movie_details_local_ds.dart';

@Injectable(as: MovieDetailsLocalDs)
class MovieDetailsLocalDsImpl extends MovieDetailsLocalDs {
  SqlManager sqlManager;

  MovieDetailsLocalDsImpl(this.sqlManager);

  @override
  Future<int> addWishMovie(WishMovieModel wishMovieModel) async {
    String sql =
        '''INSERT INTO Movie (id,image,date,title) VALUES ("${wishMovieModel.id}","${wishMovieModel.image}","${wishMovieModel.date}","${wishMovieModel.title}")''';
    int response = await sqlManager.addData(sql);
    return response;
  }

  @override
  Future<int> deleteFromWishMovie(WishMovieModel wishMovieModel) async {
    var response = await sqlManager.removeData('''
  DELETE FROM Movie WHERE id = "${wishMovieModel.id}"
  ''');
    return response;
  }

  @override
  Future<List<WishMovieModel>> getWishMovie() async {
    List<Map<String, Object?>> response = await sqlManager.getData();
    List<WishMovieModel> models =
        response.map((e) => WishMovieModel.fromJson(e)).toList();
    return models;
  }
}
