import 'dart:convert';

import 'package:aflame/core/api/api_manager.dart';
import 'package:aflame/core/api/end_points.dart';
import 'package:aflame/core/api/error.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/features/movie_details/data/models/MoreLikeThisModel.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../models/MoviewDetailsModel.dart';
import 'movie_details_ds.dart';

@Injectable(as: MovieDetailsDs)
class MovieDetailsDsImpl extends MovieDetailsDs {
  ApiManager apiManager;

  MovieDetailsDsImpl(this.apiManager);

  @override
  Future<Either<MovieDetailsModel, Failures>> getDetails(String id) async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: "${EndPoints.getMovieDetails}/$id",
          headers: {"AUTHORIZATION": AppConstants.token});
      var result = jsonDecode(response.body);
      MovieDetailsModel movieDetailsModel = MovieDetailsModel.fromJson(result);
      return Left(movieDetailsModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<MoreLikeThisModel, Failures>> getMoreLikeThis(String id) async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: "${EndPoints.getMovieDetails}/$id/similar",
          headers: {"AUTHORIZATION": AppConstants.token});
      var jsonData = jsonDecode(response.body);
      print(response.body);
      MoreLikeThisModel moreLikeThisModel =
          MoreLikeThisModel.fromJson(jsonData);
      return Left(moreLikeThisModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
