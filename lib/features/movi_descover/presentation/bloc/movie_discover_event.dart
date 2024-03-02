part of 'movie_discover_bloc.dart';

@immutable
abstract class MovieDiscoverEvent {}

class GetMovieDiscoverEvent extends MovieDiscoverEvent {
  String id;

  GetMovieDiscoverEvent(this.id);
}
