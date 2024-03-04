import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class HomeLocalDs {
  Future<List<WishMovieModel>> getWishMovieFromSql();

  Future<int> addWishMovieToSql(WishMovieModel wishMovieModel);
  Future<int> deleteFromWishMovieInSql(WishMovieModel wishMovieModel);

}
