import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/home/domain/entities/NewReleasesEntity.dart';
import 'package:aflame/features/home/domain/entities/PopularEntity.dart';
import 'package:aflame/features/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_componants.dart';
import '../../../../core/utils/app_constants.dart';

class NewReleasesItem extends StatelessWidget {
  NewReleasesDataEntity? newReleasesDataEntity;
  PopularDataEntity? resultsEntity;

  NewReleasesItem({this.newReleasesDataEntity, this.resultsEntity});

  @override
  Widget build(BuildContext context) {
    newReleasesDataEntity ??= NewReleasesDataEntity(
        id: resultsEntity?.id,
        posterPath: resultsEntity?.posterPath,
        title: resultsEntity?.title,
        backdropPath: resultsEntity?.backdropPath,
        releaseDate: resultsEntity?.releaseDate);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.topLeft,
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(
                  context, AppRoutes.movieDetails,
                  arguments: newReleasesDataEntity?.id),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: CachedNetworkImage(
                  imageUrl: AppConstants.imageBaseUrl +
                      (newReleasesDataEntity?.posterPath ?? ""),
                  fit: BoxFit.fill,
                  width: 129.w,
                  height: 199.h,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            AppComponents.addIcon(
                addMovie: () => HomeBloc.get(context).add(AddToWishListEvent(
                    WishMovieModel.fromRelease(newReleasesDataEntity!))),
                deleteMovie: () => HomeBloc.get(context).add(
                    DeleteFromWishListEvent(
                        WishMovieModel.fromRelease(newReleasesDataEntity!))),
                isWishMovie:
                    state.wishListIds?.contains(newReleasesDataEntity?.id) ??
                        false,
                homeScreenStatus: state.homeScreenStatus),
          ],
        );
      },
    );
  }
}
