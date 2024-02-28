part of 'home_bloc.dart';

enum HomeScreenStatus {
  init,
  getPopularLoading,
  getPopularSuccess,
  getPopularError,
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

  HomeState(
      {this.homeScreenStatus,
      this.failures,
      this.newReleasesEntity,
      this.recommendedEntity,
      this.popularEntity,
      this.currentTab});

  HomeState copyWith(
      {HomeScreenStatus? homeScreenStatus,
      int? currentTab,
      RecommendedEntity? recommendedEntity,
      NewReleasesEntity? newReleasesEntity,
      Failures? failures,
      PopularEntity? popularEntity}) {
    return HomeState(
        failures: failures ?? this.failures,
        recommendedEntity: recommendedEntity ?? this.recommendedEntity,
        newReleasesEntity: newReleasesEntity ?? this.newReleasesEntity,
        currentTab: currentTab ?? this.currentTab,
        popularEntity: popularEntity ?? this.popularEntity,
        homeScreenStatus: homeScreenStatus ?? this.homeScreenStatus);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(homeScreenStatus: HomeScreenStatus.init);
}
