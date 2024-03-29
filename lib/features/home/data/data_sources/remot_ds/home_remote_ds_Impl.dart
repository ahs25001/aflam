import 'dart:convert';

import 'package:aflame/core/api/api_manager.dart';
import 'package:aflame/core/api/end_points.dart';
import 'package:aflame/core/api/error.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/features/home/data/data_sources/remot_ds/home_remote_ds.dart';
import 'package:aflame/features/home/data/models/CategoryModel.dart';
import 'package:aflame/features/home/data/models/NewReleasesModel.dart';
import 'package:aflame/features/home/data/models/PopularModel.dart';
import 'package:aflame/features/home/data/models/RecommendedModel.dart';
import 'package:aflame/features/home/data/models/SearchResultModel.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDs)
class HomeRemoteDsImpl extends HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImpl(this.apiManager);

  @override
  Future<Either<PopularModel?, Failures>> getPopular() async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: EndPoints.getPopular,
          headers: {"AUTHORIZATION": AppConstants.token});
      var jsonData=jsonDecode(response.body);
      PopularModel popularModel = PopularModel.fromJson(jsonData);
      return Left(popularModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<NewReleasesModel?, Failures>> getNewReleases() async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: EndPoints.getNewReleases,
          headers: {"AUTHORIZATION": AppConstants.token});
      var jsonData=jsonDecode(response.body);
      NewReleasesModel newReleasesModel =
          NewReleasesModel.fromJson(jsonData);
      return Left(newReleasesModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RecommendedModel?, Failures>> getRecommended() async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: EndPoints.getRecommended,
          headers: {"AUTHORIZATION": AppConstants.token});
      var jsonData = jsonDecode(response.body);
      RecommendedModel recommendedModel = RecommendedModel.fromJson(jsonData);
      return Left(recommendedModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<SearchResultModel?, Failures>> search(String key) async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: EndPoints.search,
          headers: {"AUTHORIZATION": AppConstants.token},
          queryParameters: {"query": key});
      var jsonData = jsonDecode(response.body);
      SearchResultModel searchResultModel =
          SearchResultModel.fromJson(jsonData);
      return Left(searchResultModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<CategoryModel?, Failures>> getCategories() async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: EndPoints.getCategories,
          headers: {"AUTHORIZATION": AppConstants.token});
      var jsonData = jsonDecode(response.body);
      CategoryModel categoryModel = CategoryModel.fromJson(jsonData);
      return Left(categoryModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
