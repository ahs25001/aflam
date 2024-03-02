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
import 'features/home/data/data_sources/home_remote_ds.dart' as _i4;
import 'features/home/data/data_sources/home_remote_ds_Impl.dart' as _i5;
import 'features/home/data/repositories/home_repo_impl.dart' as _i7;
import 'features/home/domain/repositories/home_repo.dart' as _i6;
import 'features/home/domain/use_cases/get_categories_use_case.dart' as _i17;
import 'features/home/domain/use_cases/get_new_releases_useCase.dart' as _i21;
import 'features/home/domain/use_cases/get_popular_useCase.dart' as _i22;
import 'features/home/domain/use_cases/get_recommended_useCase.dart' as _i23;
import 'features/home/domain/use_cases/search_use_case.dart' as _i16;
import 'features/home/presentation/bloc/home_bloc.dart' as _i24;
import 'features/movi_descover/data/data_sources/movie_discover_ds.dart'
    as _i12;
import 'features/movi_descover/data/data_sources/movie_discover_ds_impl.dart'
    as _i13;
import 'features/movi_descover/data/repositories/movie_discover_repo_impl.dart'
    as _i15;
import 'features/movi_descover/domain/repositories/movie_discover_repo.dart'
    as _i14;
import 'features/movi_descover/domain/use_cases/get_movie_discover_use_case.dart'
    as _i20;
import 'features/movi_descover/presentation/bloc/movie_discover_bloc.dart'
    as _i26;
import 'features/movie_details/data/data_sources/movie_details_ds.dart' as _i8;
import 'features/movie_details/data/data_sources/movie_details_ds_impl.dart'
    as _i9;
import 'features/movie_details/data/repositories/movie_details_repo_impl.dart'
    as _i11;
import 'features/movie_details/domain/repositories/movie_details_repo.dart'
    as _i10;
import 'features/movie_details/domain/use_cases/get_more_like_this_use_case.dart'
    as _i18;
import 'features/movie_details/domain/use_cases/get_movie_details_use_case.dart'
    as _i19;
import 'features/movie_details/presentation/bloc/movie_details_bloc.dart'
    as _i25;

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
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(gh<_i4.HomeRemoteDs>()));
    gh.factory<_i8.MovieDetailsDs>(
        () => _i9.MovieDetailsDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.MovieDetailsRepo>(
        () => _i11.MovieDetailsRepoImpl(gh<_i8.MovieDetailsDs>()));
    gh.factory<_i12.MovieDiscoverDs>(
        () => _i13.MovieDiscoverDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.MovieDiscoverRepo>(
        () => _i15.MovieDiscoverRepoImpl(gh<_i12.MovieDiscoverDs>()));
    gh.factory<_i16.SearchUseCase>(
        () => _i16.SearchUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i17.GetCategoriesUseCase>(
        () => _i17.GetCategoriesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i18.GetMoreLikeThisUseCase>(
        () => _i18.GetMoreLikeThisUseCase(gh<_i10.MovieDetailsRepo>()));
    gh.factory<_i19.GetMovieDetailsUseCase>(
        () => _i19.GetMovieDetailsUseCase(gh<_i10.MovieDetailsRepo>()));
    gh.factory<_i20.GetMovieDiscoverUseCase>(
        () => _i20.GetMovieDiscoverUseCase(gh<_i14.MovieDiscoverRepo>()));
    gh.factory<_i21.GetNewReleasesUseCase>(
        () => _i21.GetNewReleasesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i22.GetPopularUseCase>(
        () => _i22.GetPopularUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i23.GetRecommendedUseCase>(
        () => _i23.GetRecommendedUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i24.HomeBloc>(() => _i24.HomeBloc(
          gh<_i22.GetPopularUseCase>(),
          gh<_i21.GetNewReleasesUseCase>(),
          gh<_i23.GetRecommendedUseCase>(),
          gh<_i16.SearchUseCase>(),
          gh<_i17.GetCategoriesUseCase>(),
        ));
    gh.factory<_i25.MovieDetailsBloc>(() => _i25.MovieDetailsBloc(
          gh<_i19.GetMovieDetailsUseCase>(),
          gh<_i18.GetMoreLikeThisUseCase>(),
        ));
    gh.factory<_i26.MovieDiscoverBloc>(
        () => _i26.MovieDiscoverBloc(gh<_i20.GetMovieDiscoverUseCase>()));
    return this;
  }
}
