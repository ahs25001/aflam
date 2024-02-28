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
        listener: (context, state) {},
        builder: (context, state) {
          return (state.homeScreenStatus ==
                      HomeScreenStatus.getRecommendedLoading ||
                  state.homeScreenStatus ==
                      HomeScreenStatus.getPopularLoading ||
                  state.homeScreenStatus ==
                      HomeScreenStatus.getNewReleasesLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.amber,
                ))
              : SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
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
        });
  }
}
