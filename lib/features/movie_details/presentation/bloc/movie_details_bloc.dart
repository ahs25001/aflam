import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/MoreLikeThisEntity.dart';
import '../../domain/use_cases/get_more_like_this_use_case.dart';
import '../../domain/use_cases/get_movie_details_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMoreLikeThisUseCase getMoreLikeThisUseCase;
  static MovieDetailsBloc get(BuildContext context) =>BlocProvider.of(context);
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getMoreLikeThisUseCase)
      : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is GetMovieDetailsEvent) {
        emit(state.copyWith(
            movieDetailsScreenStatus: MovieDetailsScreenStatus.loading));
        var response = await getMovieDetailsUseCase(event.id);
        response.fold((l) {
          emit(state.copyWith(
              movieDetailsScreenStatus:
                  MovieDetailsScreenStatus.getDetailsSuccess,
              movieDetailsEntity: l));
        },
            (r) => emit(state.copyWith(
                movieDetailsScreenStatus:
                    MovieDetailsScreenStatus.getDetailsError,
                failures: r)));
      } else if (event is GetMoreLikeThisEvent) {
        emit(state.copyWith(
            movieDetailsScreenStatus: MovieDetailsScreenStatus.loading));
        var response = await getMoreLikeThisUseCase(event.id);
        response.fold(
            (l) => emit(state.copyWith(
                movieDetailsScreenStatus:
                    MovieDetailsScreenStatus.getMoreLikeThisSuccess,
                moreLikeThisEntity: l)),
            (r) => emit(state.copyWith(
                movieDetailsScreenStatus:
                    MovieDetailsScreenStatus.getMoreLikeThisError,
                failures: r)));
      } else if (event is ShowMoreEvent) {
        emit(state.copyWith(isFull: event.isFull));
      }
    });
  }
}
