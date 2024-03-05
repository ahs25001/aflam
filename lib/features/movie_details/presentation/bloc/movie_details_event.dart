part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  String id;

  GetMovieDetailsEvent(this.id);
}

class AddToWishListFromDetailsEvent extends MovieDetailsEvent {
  WishMovieModel wishMovieModel;

  AddToWishListFromDetailsEvent(this.wishMovieModel);
}

class GetIdsEvent extends MovieDetailsEvent {}

class DeleteFromWishListFromDetailsEvent extends MovieDetailsEvent {
  WishMovieModel wishMovieModel;

  DeleteFromWishListFromDetailsEvent(this.wishMovieModel);
}

class GetMoreLikeThisEvent extends MovieDetailsEvent {
  String id;

  GetMoreLikeThisEvent(this.id);
}

class ShowMoreEvent extends MovieDetailsEvent {
  bool isFull;

  ShowMoreEvent(this.isFull);
}
