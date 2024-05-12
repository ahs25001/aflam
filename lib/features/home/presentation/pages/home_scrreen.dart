import 'package:aflame/app/app_bloc.dart';
import 'package:aflame/config.dart';
import 'package:aflame/core/utils/app_strings.dart';
import 'package:aflame/features/home/domain/use_cases/add_movie_to_wish_use_case.dart';
import 'package:aflame/features/home/domain/use_cases/delete_from_wish_list_use_case.dart';
import 'package:aflame/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:aflame/features/home/domain/use_cases/get_new_releases_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/get_popular_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/get_recommended_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/get_wish_move_use_case.dart';
import 'package:aflame/features/home/domain/use_cases/search_use_case.dart';
import 'package:aflame/features/home/presentation/pages/category_tab.dart';
import 'package:aflame/features/home/presentation/pages/home_tab.dart';
import 'package:aflame/features/home/presentation/pages/search_tab.dart';
import 'package:aflame/features/home/presentation/pages/wishs_tab.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          getIt<GetPopularUseCase>(),
          getIt<GetNewReleasesUseCase>(),
          getIt<GetRecommendedUseCase>(),
          getIt<SearchUseCase>(),
          getIt<GetCategoriesUseCase>(),
          getIt<AddMovieToWishUseCase>(),
          getIt<GetWishMovieUseCase>(),
          getIt<DeleteFromWishListUseCase>())
        ..add(GetPopularEvent())
        ..add(GetNewReleasesEvent())
        ..add(GetRecommendedEvent())
        ..add(GetCategoriesEvent())
        ..add(GetWishListEvent()),
      child: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.homeScreenStatus == HomeScreenStatus.getPopularError ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getNewReleasesError ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getRecommendedError) {
              showDialog(
                  context: context,
                  builder: (context) => PopScope(
                        canPop: false,
                        child: AlertDialog(
                          content: Text(state.failures?.massage ?? "error"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(AppStrings.cancel))
                          ],
                        ),
                      ));
            } else if (state.homeScreenStatus ==
                    HomeScreenStatus.addToWishSuccess ||
                state.homeScreenStatus ==
                    HomeScreenStatus.deleteFromWishSuccess) {
              HomeBloc.get(context).add(GetWishListEvent());
            } else if (state.homeScreenStatus ==
                HomeScreenStatus.wishListUpdatedFromDetails) {
              HomeBloc.get(context).add(GetWishListEvent());
            }
          },
          builder: (context, state) {
            List<Widget> tabs = [
              const HomeTab(),
              const SearchTab(),
              const CategoryTab(),
              WishesTab()
            ];
            return Scaffold(
              // backgroundColor: AppColors.appBackGround,
              bottomNavigationBar: CurvedNavigationBar(
                index: state.currentTab ?? 0,
                backgroundColor: Theme.of(context).colorScheme.primary,
                buttonBackgroundColor: Theme.of(context).colorScheme.onPrimary,
                color: Theme.of(context).colorScheme.onPrimary,
                onTap: (value) {
                  if (value == 3) {
                    HomeBloc.get(context)
                      ..add(ChangeTabEvent(value))
                      ..add(GetWishListEvent());
                  } else {
                    HomeBloc.get(context).add(ChangeTabEvent(value));
                  }
                },
                items: [
                  const Icon(
                    Icons.home,
                  ),
                  const Icon(Icons.search),
                  const Icon(Icons.movie),
                  Icon(Icons.favorite,
                      color: (state.currentTab == 3)
                          ? Colors.red
                          : Theme.of(context).colorScheme.onSurface)
                ],
              ),
              body: NestedScrollView(
                body: RefreshIndicator(
                    onRefresh: () async {
                      HomeBloc.get(context)
                        ..add(GetPopularEvent())
                        ..add(GetNewReleasesEvent())
                        ..add(GetRecommendedEvent())
                        ..add(GetCategoriesEvent())
                        ..add(GetWishListEvent());
                    },
                    child: tabs[state.currentTab ?? 0]),

                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      // bottom: PreferredSize(child: Container(color: re, ,),),
                     // floating: true,
                      title: Text(AppStrings.appTitle,
                          style: AppStyles.movieDetailsTitleStyle.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,

                          ),textAlign: TextAlign.center,),
                      actions: [
                        IconButton(
                            onPressed: () {
                              AppBloc.get(context).add(ChangeModeEvent());
                            },
                            icon:
                                (AppBloc.get(context).state.mode == Mode.light)
                                    ? const Icon(Icons.sunny)
                                    : const Icon(Icons.nightlight))
                      ],
                    )
                  ];
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
