part of 'movie_details_bloc.dart';

@immutable
enum MovieDetailsScreenStatus {
  init,
  loading,
  getDetailsSuccess,
  getDetailsError,
}

class MovieDetailsState {
  MovieDetailsScreenStatus? movieDetailsScreenStatus;
  Failures? failures;
  MovieDetailsEntity? movieDetailsEntity;

  MovieDetailsState(
      {this.movieDetailsScreenStatus, this.failures, this.movieDetailsEntity});

  copyWith(
      {MovieDetailsScreenStatus? movieDetailsScreenStatus,
      Failures? failures,
      MovieDetailsEntity? movieDetailsEntity}) {
    return MovieDetailsState(
        failures: failures ?? this.failures,
        movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
        movieDetailsScreenStatus:
            movieDetailsScreenStatus ?? this.movieDetailsScreenStatus);
  }
}

class MovieDetailsInitial extends MovieDetailsState {
  MovieDetailsInitial()
      : super(movieDetailsScreenStatus: MovieDetailsScreenStatus.init);
}
