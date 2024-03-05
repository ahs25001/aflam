part of 'movie_details_bloc.dart';

@immutable
enum MovieDetailsScreenStatus {
  init,
  loading,
  getDetailsSuccess,
  getDetailsError,
  getMoreLikeThisSuccess,
  getMoreLikeThisError,
  addToWishLoading,
  addToWishSuccess,
  addToWishError,
  deleteFromWishLoading,
  deleteFromWishSuccess,
  deleteFromWishError,
  getWishListIdsLoading,
  getWishListIdsSuccess,
  getWishListIdsError,
}

class MovieDetailsState {
  MovieDetailsScreenStatus? movieDetailsScreenStatus;
  Failures? failures;
  MovieDetailsEntity? movieDetailsEntity;
  MoreLikeThisEntity? moreLikeThisEntity;
  bool? isFull;
  List<num?>? wishListIds;

  MovieDetailsState({this.movieDetailsScreenStatus,
    this.failures,
    this.movieDetailsEntity,
    this.isFull,
    this.wishListIds,
    this.moreLikeThisEntity});

  copyWith(
      {MovieDetailsScreenStatus? movieDetailsScreenStatus,
      Failures? failures,
      bool? isFull,
      MoreLikeThisEntity? moreLikeThisEntity,
      List<num?>? wishListIds,
      MovieDetailsEntity? movieDetailsEntity}) {
    return MovieDetailsState(
        failures: failures ?? this.failures,
        isFull: isFull ?? this.isFull,
        wishListIds: wishListIds ?? this.wishListIds,
        moreLikeThisEntity: moreLikeThisEntity ?? this.moreLikeThisEntity,
        movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
        movieDetailsScreenStatus:
            movieDetailsScreenStatus ?? this.movieDetailsScreenStatus);
  }
}

class MovieDetailsInitial extends MovieDetailsState {
  MovieDetailsInitial()
      : super(movieDetailsScreenStatus: MovieDetailsScreenStatus.init);
}
