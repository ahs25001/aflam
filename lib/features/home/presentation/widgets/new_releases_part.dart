import 'package:aflame/core/utils/app_strings.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/NewReleasesEntity.dart';
import 'package:aflame/features/home/presentation/widgets/new_releases_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_bloc.dart';

class NewReleasesPart extends StatelessWidget {
  NewReleasesEntity? newReleasesEntity;

  NewReleasesPart(this.newReleasesEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.homeScreenStatus ==
              HomeScreenStatus.getNewReleasesLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            color: Theme.of(context).colorScheme.onPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.newReleases,
                  style: AppStyles.categoryTitleStyle
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0.h, horizontal: 8.w),
                      child: NewReleasesItem(
                        newReleasesDataEntity:
                            newReleasesEntity?.results?[index],
                      ),
                    ),
                    itemCount: newReleasesEntity?.results?.length ?? 0,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
