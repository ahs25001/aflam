import 'package:aflame/core/api/error.dart';
import 'package:aflame/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:aflame/features/home/domain/use_cases/get_new_releases_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/get_recommended_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/search_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/CategoryEntity.dart';
import '../../domain/entities/NewReleasesEntity.dart';
import '../../domain/entities/PopularEntity.dart';
import '../../domain/entities/RecommendedEntity.dart';
import '../../domain/entities/SearchResultEntity.dart';
import '../../domain/use_cases/get_popular_useCase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPopularUseCase getPopularUseCase;
  GetNewReleasesUseCase getNewReleasesUseCase;
  GetRecommendedUseCase getRecommendedUseCase;
  SearchUseCase searchUseCase;
  GetCategoriesUseCase getCategoriesUseCase;

  TextEditingController searchController = TextEditingController();

  static HomeBloc get(BuildContext context) => BlocProvider.of(context);

  HomeBloc(this.getPopularUseCase, this.getNewReleasesUseCase,
      this.getRecommendedUseCase, this.searchUseCase, this.getCategoriesUseCase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetPopularEvent) {
        emit(state.copyWith(
            homeScreenStatus: HomeScreenStatus.getPopularLoading));
        var response = await getPopularUseCase();
        response.fold(
            (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getPopularSuccess,
                popularEntity: l)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getPopularError,
                failures: r)));
      } else if (event is ChangeTabEvent) {
        emit(state.copyWith(currentTab: event.newIndex));
      } else if (event is GetNewReleasesEvent) {
        emit(state.copyWith(
            homeScreenStatus: HomeScreenStatus.getNewReleasesLoading));
        var response = await getNewReleasesUseCase();
        response.fold(
            (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getNewReleasesSuccess,
                newReleasesEntity: l)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getNewReleasesError,
                failures: r)));
      } else if (event is GetRecommendedEvent) {
        emit(state.copyWith(
            homeScreenStatus: HomeScreenStatus.getRecommendedLoading));
        var response = await getRecommendedUseCase();
        response.fold(
            (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getRecommendedSuccess,
                recommendedEntity: l)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getRecommendedError,
                failures: r)));
      } else if (event is SearchEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.searchLoading));
        var response = await searchUseCase(event.key);
        response.fold(
            (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.searchSuccess,
                searchResultEntity: l)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.searchError, failures: r)));
      } else if (event is GetCategoriesEvent) {
        emit(state.copyWith(
            homeScreenStatus: HomeScreenStatus.getCategoriesLoading));
        var response = await getCategoriesUseCase();
        response.fold(
            (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getCategoriesSuccess,
                categoryEntity: l)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getCategoriesError,
                failures: r)));
      }
    });
  }
}
