import 'package:injectable/injectable.dart';

import '../../../../home/data/models/WishMovieModel.dart';

@injectable
abstract class MovieDetailsLocalDs{
  Future<List<WishMovieModel>> getWishMovie();

  Future<int> addWishMovie(WishMovieModel wishMovieModel);
  Future<int> deleteFromWishMovie(WishMovieModel wishMovieModel);

}