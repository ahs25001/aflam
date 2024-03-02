import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/CategoryEntity.dart';

@injectable
class GetCategoriesUseCase {
  HomeRepo homeRepo;

  GetCategoriesUseCase(this.homeRepo);

  Future<Either<CategoryEntity?, Failures>> call() => homeRepo.getCategories();
}
