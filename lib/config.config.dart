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
import 'core/sql/sql_manager.dart' as _i14;
import 'features/home/data/data_sources/local_ds/home_local_ds.dart' as _i19;
import 'features/home/data/data_sources/local_ds/home_local_ds_impl.dart'
    as _i20;
import 'features/home/data/data_sources/remot_ds/home_remote_ds.dart' as _i4;
import 'features/home/data/data_sources/remot_ds/home_remote_ds_Impl.dart'
    as _i5;
import 'features/home/data/repositories/home_repo_impl.dart' as _i22;
import 'features/home/domain/repositories/home_repo.dart' as _i21;
import 'features/home/domain/use_cases/add_movie_to_wish_use_case.dart' as _i26;
import 'features/home/domain/use_cases/delete_from_wish_list_use_case.dart'
    as _i27;
import 'features/home/domain/use_cases/get_categories_use_case.dart' as _i28;
import 'features/home/domain/use_cases/get_new_releases_useCase.dart' as _i29;
import 'features/home/domain/use_cases/get_popular_useCase.dart' as _i30;
import 'features/home/domain/use_cases/get_recommended_useCase.dart' as _i31;
import 'features/home/domain/use_cases/get_wish_move_use_case.dart' as _i32;
import 'features/home/domain/use_cases/search_use_case.dart' as _i25;
import 'features/home/presentation/bloc/home_bloc.dart' as _i33;
import 'features/home/presentation/pages/wishs_tab.dart' as _i15;
import 'features/movi_descover/data/data_sources/movie_discover_ds.dart'
    as _i10;
import 'features/movi_descover/data/data_sources/movie_discover_ds_impl.dart'
    as _i11;
import 'features/movi_descover/data/repositories/movie_discover_repo_impl.dart'
    as _i13;
import 'features/movi_descover/domain/repositories/movie_discover_repo.dart'
    as _i12;
import 'features/movi_descover/domain/use_cases/get_movie_discover_use_case.dart'
    as _i18;
import 'features/movi_descover/presentation/bloc/movie_discover_bloc.dart'
    as _i24;
import 'features/movie_details/data/data_sources/movie_details_ds.dart' as _i6;
import 'features/movie_details/data/data_sources/movie_details_ds_impl.dart'
    as _i7;
import 'features/movie_details/data/repositories/movie_details_repo_impl.dart'
    as _i9;
import 'features/movie_details/domain/repositories/movie_details_repo.dart'
    as _i8;
import 'features/movie_details/domain/use_cases/get_more_like_this_use_case.dart'
    as _i16;
import 'features/movie_details/domain/use_cases/get_movie_details_use_case.dart'
    as _i17;
import 'features/movie_details/presentation/bloc/movie_details_bloc.dart'
    as _i23;

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
    gh.factory<_i8.MovieDetailsRepo>(
        () => _i9.MovieDetailsRepoImpl(gh<_i6.MovieDetailsDs>()));
    gh.factory<_i10.MovieDiscoverDs>(
        () => _i11.MovieDiscoverDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.MovieDiscoverRepo>(
        () => _i13.MovieDiscoverRepoImpl(gh<_i10.MovieDiscoverDs>()));
    gh.singleton<_i14.SqlManager>(_i14.SqlManager());
    gh.factory<_i15.WishesTab>(() => _i15.WishesTab());
    gh.factory<_i16.GetMoreLikeThisUseCase>(
        () => _i16.GetMoreLikeThisUseCase(gh<_i8.MovieDetailsRepo>()));
    gh.factory<_i17.GetMovieDetailsUseCase>(
        () => _i17.GetMovieDetailsUseCase(gh<_i8.MovieDetailsRepo>()));
    gh.factory<_i18.GetMovieDiscoverUseCase>(
        () => _i18.GetMovieDiscoverUseCase(gh<_i12.MovieDiscoverRepo>()));
    gh.factory<_i19.HomeLocalDs>(
        () => _i20.HomeLocalDsImpl(gh<_i14.SqlManager>()));
    gh.factory<_i21.HomeRepo>(() => _i22.HomeRepoImpl(
          gh<_i4.HomeRemoteDs>(),
          gh<_i19.HomeLocalDs>(),
        ));
    gh.factory<_i23.MovieDetailsBloc>(() => _i23.MovieDetailsBloc(
          gh<_i17.GetMovieDetailsUseCase>(),
          gh<_i16.GetMoreLikeThisUseCase>(),
        ));
    gh.factory<_i24.MovieDiscoverBloc>(
        () => _i24.MovieDiscoverBloc(gh<_i18.GetMovieDiscoverUseCase>()));
    gh.factory<_i25.SearchUseCase>(
        () => _i25.SearchUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i26.AddMovieToWishUseCase>(
        () => _i26.AddMovieToWishUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i27.DeleteFromWishListUseCase>(
        () => _i27.DeleteFromWishListUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i28.GetCategoriesUseCase>(
        () => _i28.GetCategoriesUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i29.GetNewReleasesUseCase>(
        () => _i29.GetNewReleasesUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i30.GetPopularUseCase>(
        () => _i30.GetPopularUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i31.GetRecommendedUseCase>(
        () => _i31.GetRecommendedUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i32.GetWishMovieUseCase>(
        () => _i32.GetWishMovieUseCase(gh<_i21.HomeRepo>()));
    gh.factory<_i33.HomeBloc>(() => _i33.HomeBloc(
          gh<_i30.GetPopularUseCase>(),
          gh<_i29.GetNewReleasesUseCase>(),
          gh<_i31.GetRecommendedUseCase>(),
          gh<_i25.SearchUseCase>(),
          gh<_i28.GetCategoriesUseCase>(),
          gh<_i26.AddMovieToWishUseCase>(),
          gh<_i32.GetWishMovieUseCase>(),
          gh<_i27.DeleteFromWishListUseCase>(),
        ));
    return this;
  }
}
