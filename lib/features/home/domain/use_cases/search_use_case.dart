import 'package:aflame/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/SearchResultEntity.dart';

@injectable
class SearchUseCase {
  HomeRepo homeRepo;

  SearchUseCase(this.homeRepo);

  Future<Either<SearchResultEntity?, Failures>> call(String key) =>
      homeRepo.search(key);
}
