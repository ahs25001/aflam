part of 'home_bloc.dart';

enum HomeScreenStatus {
  init,
  getPopularLoading,
  getPopularSuccess,
  getPopularError,
  getCategoriesLoading,
  getCategoriesSuccess,
  getCategoriesError,
  searchLoading,
  searchSuccess,
  searchError,
  getNewReleasesLoading,
  getNewReleasesSuccess,
  getNewReleasesError,
  getRecommendedLoading,
  getRecommendedSuccess,
  getRecommendedError,
}

@immutable
class HomeState {
  HomeScreenStatus? homeScreenStatus;
  Failures? failures;
  PopularEntity? popularEntity;
  int? currentTab;
  NewReleasesEntity? newReleasesEntity;
  RecommendedEntity? recommendedEntity;
  SearchResultEntity? searchResultEntity;
  CategoryEntity? categoryEntity;

  HomeState(
      {this.homeScreenStatus,
      this.failures,
      this.newReleasesEntity,
      this.categoryEntity,
      this.searchResultEntity,
      this.recommendedEntity,
      this.popularEntity,
      this.currentTab});

  HomeState copyWith(
      {HomeScreenStatus? homeScreenStatus,
      CategoryEntity? categoryEntity,
      SearchResultEntity? searchResultEntity,
      int? currentTab,
      RecommendedEntity? recommendedEntity,
      NewReleasesEntity? newReleasesEntity,
      Failures? failures,
      PopularEntity? popularEntity}) {
    return HomeState(
        failures: failures ?? this.failures,
        categoryEntity: categoryEntity ?? this.categoryEntity,
        recommendedEntity: recommendedEntity ?? this.recommendedEntity,
        newReleasesEntity: newReleasesEntity ?? this.newReleasesEntity,
        currentTab: currentTab ?? this.currentTab,
        popularEntity: popularEntity ?? this.popularEntity,
        searchResultEntity: searchResultEntity ?? this.searchResultEntity,
        homeScreenStatus: homeScreenStatus ?? this.homeScreenStatus);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(homeScreenStatus: HomeScreenStatus.init);
}
