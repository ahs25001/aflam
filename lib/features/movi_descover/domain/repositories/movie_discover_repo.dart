import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movi_descover/domain/entities/MoveDiscoverEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@injectable
abstract class MovieDiscoverRepo{
  Future<Either<MovieDiscoverEntity,Failures>> getDiscover(String id);
}