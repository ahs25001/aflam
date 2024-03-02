import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/home/data/models/CategoryModel.dart';
import 'package:aflame/features/home/data/models/NewReleasesModel.dart';
import 'package:aflame/features/home/data/models/PopularModel.dart';
import 'package:aflame/features/home/data/models/RecommendedModel.dart';
import 'package:aflame/features/home/data/models/SearchResultModel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class HomeRemoteDs {
  Future<Either<PopularModel?, Failures>> getPopular();

  Future<Either<NewReleasesModel?, Failures>> getNewReleases();

  Future<Either<RecommendedModel?, Failures>> getRecommended();

  Future<Either<CategoryModel?, Failures>> getCategories();

  Future<Either<SearchResultModel?, Failures>> search(String key);
}
