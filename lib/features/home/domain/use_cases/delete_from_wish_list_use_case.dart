import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteFromWishListUseCase {
  HomeRepo homeRepo;

  DeleteFromWishListUseCase(this.homeRepo);

  Future<int> call(WishMovieModel wishMovieModel) =>
      homeRepo.deleteFromWishList(wishMovieModel);
}
