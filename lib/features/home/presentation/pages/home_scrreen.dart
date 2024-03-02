import 'package:aflame/config.dart';
import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:aflame/features/home/domain/use_cases/get_new_releases_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/get_popular_useCase.dart';
import 'package:aflame/features/home/domain/use_cases/get_recommended_useCase.dart';
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
          getIt<GetCategoriesUseCase>())
        ..add(GetPopularEvent())
        ..add(GetNewReleasesEvent())
        ..add(GetRecommendedEvent())
        ..add(GetCategoriesEvent()),
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
                  builder: (context) => AlertDialog(
                        content: Text(state.failures?.massage ?? "error"),
                      ));
            }
          },
          builder: (context, state) {
            List<Widget> tabs = [
              const HomeTab(),
              const SearchTab(),
              const CategoryTab(),
              const WishesTab()
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
