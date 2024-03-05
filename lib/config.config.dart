// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'core/sql/sql_manager.dart' as _i12;
import 'features/home/data/data_sources/local_ds/home_local_ds.dart' as _i15;
import 'features/home/data/data_sources/local_ds/home_local_ds_impl.dart'
    as _i16;
import 'features/home/data/data_sources/remot_ds/home_remote_ds.dart' as _i4;
import 'features/home/data/data_sources/remot_ds/home_remote_ds_Impl.dart'
    as _i5;
import 'features/home/data/repositories/home_repo_impl.dart' as _i18;
import 'features/home/domain/repositories/home_repo.dart' as _i17;
import 'features/home/domain/use_cases/add_movie_to_wish_use_case.dart' as _i25;
import 'features/home/domain/use_cases/delete_from_wish_list_use_case.dart'
    as _i28;
import 'features/home/domain/use_cases/get_categories_use_case.dart' as _i29;
import 'features/home/domain/use_cases/get_new_releases_useCase.dart' as _i32;
import 'features/home/domain/use_cases/get_popular_useCase.dart' as _i33;
import 'features/home/domain/use_cases/get_recommended_useCase.dart' as _i34;
import 'features/home/domain/use_cases/get_wish_move_use_case.dart' as _i36;
import 'features/home/domain/use_cases/search_use_case.dart' as _i24;
import 'features/home/presentation/bloc/home_bloc.dart' as _i37;
import 'features/home/presentation/pages/wishs_tab.dart' as _i13;
import 'features/movi_descover/data/data_sources/movie_discover_ds.dart' as _i8;
import 'features/movi_descover/data/data_sources/movie_discover_ds_impl.dart'
    as _i9;
import 'features/movi_descover/data/repositories/movie_discover_repo_impl.dart'
    as _i11;
import 'features/movi_descover/domain/repositories/movie_discover_repo.dart'
    as _i10;
import 'features/movi_descover/domain/use_cases/get_movie_discover_use_case.dart'
    as _i14;
import 'features/movi_descover/presentation/bloc/movie_discover_bloc.dart'
    as _i23;
import 'features/movie_details/data/data_sources/movie_details_local_ds/movie_details_local_ds.dart'
    as _i19;
import 'features/movie_details/data/data_sources/movie_details_local_ds/movie_details_local_ds_impl.dart'
    as _i20;
import 'features/movie_details/data/data_sources/movie_details_remot_ds/movie_details_ds.dart'
    as _i6;
import 'features/movie_details/data/data_sources/movie_details_remot_ds/movie_details_ds_impl.dart'
    as _i7;
import 'features/movie_details/data/repositories/movie_details_repo_impl.dart'
    as _i22;
import 'features/movie_details/domain/repositories/movie_details_repo.dart'
    as _i21;
import 'features/movie_details/domain/use_cases/add_to_wish_list_from_details_use_case.dart'
    as _i26;
import 'features/movie_details/domain/use_cases/delete_from_wish_list_from_details_use_case.dart'
    as _i27;
import 'features/movie_details/domain/use_cases/get_%20wish_list_from_details_use_case.dart'
    as _i35;
import 'features/movie_details/domain/use_cases/get_more_like_this_use_case.dart'
    as _i30;
import 'features/movie_details/domain/use_cases/get_movie_details_use_case.dart'
    as _i31;
import 'features/movie_details/presentation/bloc/movie_details_bloc.dart'
    as _i38;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.HomeRemoteDs>(
        () => _i5.HomeRemoteDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.MovieDetailsDs>(
        () => _i7.MovieDetailsDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.MovieDiscoverDs>(
        () => _i9.MovieDiscoverDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.MovieDiscoverRepo>(
        () => _i11.MovieDiscoverRepoImpl(gh<_i8.MovieDiscoverDs>()));
    gh.singleton<_i12.SqlManager>(_i12.SqlManager());
    gh.factory<_i13.WishesTab>(() => _i13.WishesTab());
    gh.factory<_i14.GetMovieDiscoverUseCase>(
        () => _i14.GetMovieDiscoverUseCase(gh<_i10.MovieDiscoverRepo>()));
    gh.factory<_i15.HomeLocalDs>(
        () => _i16.HomeLocalDsImpl(gh<_i12.SqlManager>()));
    gh.factory<_i17.HomeRepo>(() => _i18.HomeRepoImpl(
          gh<_i4.HomeRemoteDs>(),
          gh<_i15.HomeLocalDs>(),
        ));
    gh.factory<_i19.MovieDetailsLocalDs>(
        () => _i20.MovieDetailsLocalDsImpl(gh<_i12.SqlManager>()));
    gh.factory<_i21.MovieDetailsRepo>(() => _i22.MovieDetailsRepoImpl(
          gh<_i6.MovieDetailsDs>(),
          gh<_i19.MovieDetailsLocalDs>(),
        ));
    gh.factory<_i23.MovieDiscoverBloc>(
        () => _i23.MovieDiscoverBloc(gh<_i14.GetMovieDiscoverUseCase>()));
    gh.factory<_i24.SearchUseCase>(
        () => _i24.SearchUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i25.AddMovieToWishUseCase>(
        () => _i25.AddMovieToWishUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i26.AddToWishListFromDetailsUseCase>(() =>
        _i26.AddToWishListFromDetailsUseCase(gh<_i21.MovieDetailsRepo>()));
    gh.factory<_i27.DeleteFromWishListFromDetailsUseCse>(() =>
        _i27.DeleteFromWishListFromDetailsUseCse(gh<_i21.MovieDetailsRepo>()));
    gh.factory<_i28.DeleteFromWishListUseCase>(
        () => _i28.DeleteFromWishListUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i29.GetCategoriesUseCase>(
        () => _i29.GetCategoriesUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i30.GetMoreLikeThisUseCase>(
        () => _i30.GetMoreLikeThisUseCase(gh<_i21.MovieDetailsRepo>()));
    gh.factory<_i31.GetMovieDetailsUseCase>(
        () => _i31.GetMovieDetailsUseCase(gh<_i21.MovieDetailsRepo>()));
    gh.factory<_i32.GetNewReleasesUseCase>(
        () => _i32.GetNewReleasesUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i33.GetPopularUseCase>(
        () => _i33.GetPopularUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i34.GetRecommendedUseCase>(
        () => _i34.GetRecommendedUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i35.GetWishListFromDetailsUseCase>(
        () => _i35.GetWishListFromDetailsUseCase(gh<_i21.MovieDetailsRepo>()));
    gh.factory<_i36.GetWishMovieUseCase>(
        () => _i36.GetWishMovieUseCase(gh<_i17.HomeRepo>()));
    gh.factory<_i37.HomeBloc>(() => _i37.HomeBloc(
          gh<_i33.GetPopularUseCase>(),
          gh<_i32.GetNewReleasesUseCase>(),
          gh<_i34.GetRecommendedUseCase>(),
          gh<_i24.SearchUseCase>(),
          gh<_i29.GetCategoriesUseCase>(),
          gh<_i25.AddMovieToWishUseCase>(),
          gh<_i36.GetWishMovieUseCase>(),
          gh<_i28.DeleteFromWishListUseCase>(),
        ));
    gh.factory<_i38.MovieDetailsBloc>(() => _i38.MovieDetailsBloc(
          gh<_i31.GetMovieDetailsUseCase>(),
          gh<_i30.GetMoreLikeThisUseCase>(),
          gh<_i26.AddToWishListFromDetailsUseCase>(),
          gh<_i27.DeleteFromWishListFromDetailsUseCse>(),
          gh<_i35.GetWishListFromDetailsUseCase>(),
        ));
    return this;
  }
}
