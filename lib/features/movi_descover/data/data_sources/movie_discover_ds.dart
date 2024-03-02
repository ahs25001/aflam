import 'package:aflame/core/api/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/MoveDiscoverModel.dart';
@injectable
abstract class MovieDiscoverDs{
  Future<Either<MovieDiscoverModel,Failures>> getDiscover(String id);
}