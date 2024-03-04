import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddMovieToWishUseCase {
  HomeRepo homeRepo;

  AddMovieToWishUseCase(this.homeRepo);

  void call(WishMovieModel wishMovieModel) =>
      homeRepo.addToWishList(wishMovieModel);
}
