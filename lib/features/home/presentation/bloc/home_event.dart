part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetPopularEvent extends HomeEvent {}

class GetNewReleasesEvent extends HomeEvent {}

class GetRecommendedEvent extends HomeEvent {}

class GetCategoriesEvent extends HomeEvent {}

class AddToWishListEvent extends HomeEvent {
  WishMovieModel wishMovieModel;

  AddToWishListEvent(this.wishMovieModel);
}

class GetWishListEvent extends HomeEvent {}

class DeleteFromWishListEvent extends HomeEvent {
  WishMovieModel wishMovieModel;

  DeleteFromWishListEvent(this.wishMovieModel);
}

class SearchEvent extends HomeEvent {
  String key;

  SearchEvent(this.key);
}

class ChangeTabEvent extends HomeEvent {
  int newIndex;

  ChangeTabEvent(this.newIndex);
}
