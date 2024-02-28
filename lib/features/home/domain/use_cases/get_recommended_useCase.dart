import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/RecommendedEntity.dart';

@injectable
class GetRecommendedUseCase {
  HomeRepo homeRepo;

  GetRecommendedUseCase(this.homeRepo);

  Future<Either<RecommendedEntity?, Failures>> call() =>
      homeRepo.getRecommended();
}
