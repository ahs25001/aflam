import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/movie_details/domain/entities/MovieDetailsEntity.dart';
import 'package:aflame/features/movie_details/domain/use_cases/add_to_wish_list_from_details_use_case.dart';
import 'package:aflame/features/movie_details/domain/use_cases/delete_from_wish_list_from_details_use_case.dart';
import 'package:aflame/features/movie_details/domain/use_cases/get_%20wish_list_from_details_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/MoreLikeThisEntity.dart';
import '../../domain/use_cases/get_more_like_this_use_case.dart';
import '../../domain/use_cases/get_movie_details_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

@injectable
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMoreLikeThisUseCase getMoreLikeThisUseCase;
  GetWishListFromDetailsUseCase getWishListFromDetailsUseCase;
  AddToWishListFromDetailsUseCase addToWishListFromDetailsUseCase;
  DeleteFromWishListFromDetailsUseCse deleteFromWishListFromDetailsUseCse;

  static MovieDetailsBloc get(BuildContext context) => BlocProvider.of(context);

  MovieDetailsBloc(
      this.getMovieDetailsUseCase,
      this.getMoreLikeThisUseCase,
      this.addToWishListFromDetailsUseCase,
      this.deleteFromWishListFromDetailsUseCse,
      this.getWishListFromDetailsUseCase)
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
      } else if (event is AddToWishListFromDetailsEvent) {
        emit(state.copyWith(
            movieDetailsScreenStatus:
                MovieDetailsScreenStatus.addToWishLoading));
        addToWishListFromDetailsUseCase(event.wishMovieModel);
        emit(state.copyWith(
            movieDetailsScreenStatus:
                MovieDetailsScreenStatus.addToWishSuccess));
      } else if (event is DeleteFromWishListFromDetailsEvent) {
        emit(state.copyWith(
            movieDetailsScreenStatus:
                MovieDetailsScreenStatus.deleteFromWishLoading));
        deleteFromWishListFromDetailsUseCse(event.wishMovieModel);
        emit(state.copyWith(
            movieDetailsScreenStatus:
                MovieDetailsScreenStatus.deleteFromWishSuccess));
      } else if (event is GetIdsEvent) {
        emit(state.copyWith(
            movieDetailsScreenStatus:
                MovieDetailsScreenStatus.getWishListIdsLoading));
        var response = await getWishListFromDetailsUseCase();
        emit(state.copyWith(
            movieDetailsScreenStatus:
                MovieDetailsScreenStatus.getWishListIdsSuccess,
            wishListIds: response.map((e) => e.id).toList()));
      }
    });
  }
}
