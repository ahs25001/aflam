import 'dart:convert';

import 'package:aflame/core/api/api_manager.dart';
import 'package:aflame/core/api/end_points.dart';
import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movi_descover/data/models/MoveDiscoverModel.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_constants.dart';
import 'movie_discover_ds.dart';

@Injectable(as: MovieDiscoverDs)
class MovieDiscoverDsImpl extends MovieDiscoverDs {
  ApiManager apiManager;

  MovieDiscoverDsImpl(this.apiManager);

  @override
  Future<Either<MovieDiscoverModel, Failures>> getDiscover(String id) async {
    try {
      http.Response response = await apiManager.getData(
          endPoint: EndPoints.getDiscover,
          headers: {"AUTHORIZATION": AppConstants.token},
          queryParameters: {"with_genres": id});
      var jsonData = jsonDecode(response.body);
      MovieDiscoverModel movieDiscoverModel =
          MovieDiscoverModel.fromJson(jsonData);
      return Left(movieDiscoverModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
