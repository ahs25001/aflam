import 'package:aflame/features/home/presentation/widgets/new_releases_part.dart';
import 'package:aflame/features/home/presentation/widgets/recommended_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_bloc.dart';
import '../widgets/popular_part.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state.homeScreenStatus == HomeScreenStatus.getRecommendedLoading ||
            state.homeScreenStatus == HomeScreenStatus.getPopularLoading ||
            state.homeScreenStatus == HomeScreenStatus.getNewReleasesLoading) {
          showDialog(
             barrierColor: Colors.transparent,
            barrierDismissible: false,
            context: context,
            builder: (context) =>  PopScope(
              canPop: false,
              child: AlertDialog(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                content: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ),
            ),
          );
        }
        else if (state.homeScreenStatus == HomeScreenStatus.getRecommendedSuccess ||
            state.homeScreenStatus == HomeScreenStatus.getPopularSuccess ||
            state.homeScreenStatus == HomeScreenStatus.getNewReleasesSuccess){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 1.01),
            child: Column(children: [
              PopularPart(state.popularEntity?.results ?? []),
              SizedBox(
                height: 13.h,
              ),
              NewReleasesPart(state.newReleasesEntity),
              RecommendedPart(state.recommendedEntity),
            ]),
          ),
        );
      },
    );
  }
}
