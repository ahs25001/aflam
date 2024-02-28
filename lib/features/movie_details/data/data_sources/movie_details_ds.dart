import 'package:aflame/core/api/error.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/MoviewDetailsModel.dart';

@injectable
abstract class MovieDetailsDs{
  Future<Either<MovieDetailsModel,Failures>>getDetails(String id);
}