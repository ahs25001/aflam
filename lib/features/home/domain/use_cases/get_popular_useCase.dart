import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/PopularEntity.dart';

@injectable
class GetPopularUseCase {
  HomeRepo homeRepo;

  GetPopularUseCase(this.homeRepo);

  Future<Either<PopularEntity?, Failures>> call() => homeRepo.getPopular();
}
