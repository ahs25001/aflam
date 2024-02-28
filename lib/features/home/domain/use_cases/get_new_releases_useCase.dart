import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/NewReleasesEntity.dart';

@injectable
class GetNewReleasesUseCase{
  HomeRepo homeRepo;

  GetNewReleasesUseCase(this.homeRepo);
  Future<Either<NewReleasesEntity?, Failures>> call()=>homeRepo.getNewReleases();
}