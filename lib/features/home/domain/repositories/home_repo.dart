import 'package:aflame/features/home/domain/entities/CategoryEntity.dart';
import 'package:aflame/features/home/domain/entities/PopularEntity.dart';
import 'package:aflame/features/home/domain/entities/RecommendedEntity.dart';
import 'package:aflame/features/home/domain/entities/SearchResultEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/error.dart';
import '../entities/NewReleasesEntity.dart';

@injectable
abstract class HomeRepo {
  Future<Either<PopularEntity?, Failures>> getPopular();

  Future<Either<NewReleasesEntity?, Failures>> getNewReleases();

  Future<Either<RecommendedEntity?, Failures>> getRecommended();
  Future<Either<CategoryEntity?, Failures>> getCategories();
  Future<Either<SearchResultEntity?, Failures>> search(String key);
}
