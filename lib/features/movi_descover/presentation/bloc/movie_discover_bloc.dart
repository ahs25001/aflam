import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movi_descover/domain/entities/MoveDiscoverEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_movie_discover_use_case.dart';

part 'movie_discover_event.dart';

part 'movie_discover_state.dart';
@injectable
class MovieDiscoverBloc extends Bloc<MovieDiscoverEvent, MovieDiscoverState> {
  GetMovieDiscoverUseCase getMovieDiscoverUseCase;

  MovieDiscoverBloc(this.getMovieDiscoverUseCase)
      : super(MovieDiscoverInitial()) {
    on<MovieDiscoverEvent>((event, emit) async {
      if (event is GetMovieDiscoverEvent) {
        emit(state.copyWith(
            movieDiscoverScreenStatus:
                MovieDiscoverScreenStatus.getMovieDiscoverLoading));
        var response = await getMovieDiscoverUseCase(event.id);
        response.fold(
            (l) => emit(state.copyWith(
                movieDiscoverScreenStatus:
                    MovieDiscoverScreenStatus.getMovieDiscoverSuccess,
                movieDiscoverEntity: l)),
            (r) => emit(state.copyWith(
                movieDiscoverScreenStatus:
                    MovieDiscoverScreenStatus.getMovieDiscoverError,
                failures: r)));
      }
    });
  }
}
