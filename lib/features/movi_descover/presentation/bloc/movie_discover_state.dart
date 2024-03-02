part of 'movie_discover_bloc.dart';

enum MovieDiscoverScreenStatus {
  init,
  getMovieDiscoverLoading,
  getMovieDiscoverError,
  getMovieDiscoverSuccess,
}

@immutable
class MovieDiscoverState {
  Failures? failures;
  MovieDiscoverScreenStatus? movieDiscoverScreenStatus;
  MovieDiscoverEntity? movieDiscoverEntity;

  MovieDiscoverState(
      {this.failures,
      this.movieDiscoverScreenStatus,
      this.movieDiscoverEntity});

  MovieDiscoverState copyWith(
      {Failures? failures,
      MovieDiscoverEntity? movieDiscoverEntity,
      MovieDiscoverScreenStatus? movieDiscoverScreenStatus}) {
    return MovieDiscoverState(
        failures: failures ?? this.failures,
        movieDiscoverEntity: movieDiscoverEntity ?? this.movieDiscoverEntity,
        movieDiscoverScreenStatus:
            movieDiscoverScreenStatus ?? this.movieDiscoverScreenStatus);
  }
}

class MovieDiscoverInitial extends MovieDiscoverState {
  MovieDiscoverInitial()
      : super(movieDiscoverScreenStatus: MovieDiscoverScreenStatus.init);
}
