import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/WishMovieModel.dart';

@injectable
class GetWishMovieUseCase {
  HomeRepo homeRepo;

  GetWishMovieUseCase(this.homeRepo);

  Future<List<WishMovieModel>> call() => homeRepo.getWishMove();
}
