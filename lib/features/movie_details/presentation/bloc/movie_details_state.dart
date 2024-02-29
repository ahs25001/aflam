part of 'movie_details_bloc.dart';

@immutable
enum MovieDetailsScreenStatus {
  init,
  loading,
  getDetailsSuccess,
  getDetailsError,
  getMoreLikeThisSuccess,
  getMoreLikeThisError,
}

class MovieDetailsState {
  MovieDetailsScreenStatus? movieDetailsScreenStatus;
  Failures? failures;
  MovieDetailsEntity? movieDetailsEntity;
  MoreLikeThisEntity? moreLikeThisEntity;
  bool? isFull;

  MovieDetailsState(
      {this.movieDetailsScreenStatus,
      this.failures,
      this.movieDetailsEntity,
      this.isFull,
      this.moreLikeThisEntity});

  copyWith(
      {MovieDetailsScreenStatus? movieDetailsScreenStatus,
      Failures? failures,
      bool? isFull,
      MoreLikeThisEntity? moreLikeThisEntity,
      MovieDetailsEntity? movieDetailsEntity}) {
    return MovieDetailsState(
        failures: failures ?? this.failures,
        isFull: isFull ?? this.isFull,
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
