import 'package:aflame/config.dart';
import 'package:aflame/core/utils/app_colors.dart';
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

import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                                child: Text(AppStrings.cancel))
                          ],
                        ),
                      ));
            } else if (state.homeScreenStatus ==
                    HomeScreenStatus.addToWishSuccess ||
                state.homeScreenStatus ==
                    HomeScreenStatus.deleteFromWishSuccess) {
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
              backgroundColor: AppColors.appBackGround,
              bottomNavigationBar: CurvedNavigationBar(
                index: state.currentTab ?? 0,
                backgroundColor: AppColors.primary,
                buttonBackgroundColor: AppColors.barColor,
                color: AppColors.barColor,
                onTap: (value) =>
                    HomeBloc.get(context).add(ChangeTabEvent(value)),
                items: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  const Icon(Icons.search, color: Colors.white),
                  const Icon(Icons.movie, color: Colors.white),
                  Icon(Icons.favorite,
                      color:
                          (state.currentTab == 3) ? Colors.red : Colors.white)
                ],
              ),
              body: tabs[state.currentTab ?? 0],
            );
          },
        ),
      ),
    );
  }
}
