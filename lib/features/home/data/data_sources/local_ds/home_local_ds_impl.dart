import 'package:injectable/injectable.dart';

import '../../../../../core/sql/sql_manager.dart';
import '../../models/WishMovieModel.dart';
import 'home_local_ds.dart';

@Injectable(as: HomeLocalDs)
class HomeLocalDsImpl extends HomeLocalDs {
  SqlManager sqlManager;

  HomeLocalDsImpl(this.sqlManager);

  @override
  Future<List<WishMovieModel>> getWishMovieFromSql() async {
    List<Map<String, Object?>> response = await sqlManager.getData();
    List<WishMovieModel> models =
        response.map((e) => WishMovieModel.fromJson(e)).toList();
    return models;
  }

  @override
  Future<int> addWishMovieToSql(WishMovieModel wishMovieModel) async {
    String sql =
        '''INSERT INTO Movie (id,image,date,title) VALUES ("${wishMovieModel.id}","${wishMovieModel.image}","${wishMovieModel.date}","${wishMovieModel.title}")''';
    int response = await sqlManager.addData(sql);
    return response;
  }

  @override
  Future<int> deleteFromWishMovieInSql(WishMovieModel wishMovieModel)async {
  var response =await sqlManager.removeData('''
  DELETE FROM Movie WHERE id = "${wishMovieModel.id}"
  ''');
  return response ;
  }
}
