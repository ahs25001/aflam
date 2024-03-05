import 'package:aflame/features/movie_details/domain/repositories/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/WishMovieModel.dart';

@injectable
class GetWishListFromDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;

  GetWishListFromDetailsUseCase(this.movieDetailsRepo);

  Future<List<WishMovieModel>> call() => movieDetailsRepo.getWishMove();
}
