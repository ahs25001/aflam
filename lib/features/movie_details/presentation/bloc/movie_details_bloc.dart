import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_movie_details_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase) : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is GetMovieDetailsEvent) {
        emit(state.copyWith(
            movieDetailsScreenStatus: MovieDetailsScreenStatus.loading));
        var response = await getMovieDetailsUseCase(event.id);
        response.fold(
            (l) {
              emit(state.copyWith(
                  movieDetailsScreenStatus:
                  MovieDetailsScreenStatus.getDetailsSuccess,
                  movieDetailsEntity: l));
            },
            (r) => emit(state.copyWith(
                movieDetailsScreenStatus:
                    MovieDetailsScreenStatus.getDetailsError,
                failures: r)));
      }
    });
  }
}
