import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishListFromDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;

  AddToWishListFromDetailsUseCase(this.movieDetailsRepo);

  Future<int> call(WishMovieModel wishMovieModel) =>
      movieDetailsRepo.addToWishList(wishMovieModel);
}
