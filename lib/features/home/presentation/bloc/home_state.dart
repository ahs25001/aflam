part of 'home_bloc.dart';

enum HomeScreenStatus {
  init,
  getPopularLoading,
  getPopularSuccess,
  getPopularError,
  addToWishLoading,
  addToWishSuccess,
  addToWishError,
  deleteFromWishLoading,
  deleteFromWishSuccess,
  deleteFromWishError,
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
  getWishListLoading,
  getWishListSuccess,
  getWishListError,
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
  List<WishMovieModel>? wishList;
  List<num?>? wishListIds;

  HomeState(
      {this.homeScreenStatus,
      this.failures,
      this.newReleasesEntity,
      this.categoryEntity,
      this.searchResultEntity,
      this.recommendedEntity,
      this.popularEntity,
      this.wishList,
      this.wishListIds,
      this.currentTab});

  HomeState copyWith(
      {HomeScreenStatus? homeScreenStatus,
      CategoryEntity? categoryEntity,
      SearchResultEntity? searchResultEntity,
      int? currentTab,
      List<WishMovieModel>? wishList,
      RecommendedEntity? recommendedEntity,
      NewReleasesEntity? newReleasesEntity,
      Failures? failures,
      List<num?>? wishListIds,
      PopularEntity? popularEntity}) {
    return HomeState(
        failures: failures ?? this.failures,
        wishList: wishList ?? this.wishList,
        wishListIds: wishListIds ?? this.wishListIds,
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
