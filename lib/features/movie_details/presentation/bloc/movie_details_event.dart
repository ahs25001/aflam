part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  String id;

  GetMovieDetailsEvent(this.id);
}
class GetMoreLikeThisEvent extends MovieDetailsEvent {
  String id;

  GetMoreLikeThisEvent(this.id);
}
class ShowMoreEvent extends MovieDetailsEvent{
  bool isFull;

  ShowMoreEvent(this.isFull);
}
