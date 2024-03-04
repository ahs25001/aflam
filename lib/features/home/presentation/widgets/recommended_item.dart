import 'package:aflame/core/utils/app_componants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/home/domain/entities/RecommendedEntity.dart';
import 'package:aflame/features/home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routs/routs.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';

class RecommendedItem extends StatelessWidget {
  RecommendedDataEntity? recommendedDataEntity;

  RecommendedItem(this.recommendedDataEntity);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Card(
          color: AppColors.cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment(-2.0.w, -1.5.h),
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutes.movieDetails,
                        arguments: recommendedDataEntity?.id),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18.r),
                      child: CachedNetworkImage(
                        imageUrl: AppConstants.imageBaseUrl +
                            (recommendedDataEntity?.posterPath ?? ""),
                        fit: BoxFit.fill,
                        width: 129.w,
                        height: 199.h,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  AppComponents.addIcon(
                      addMovie: () => HomeBloc.get(context).add(
                          AddToWishListEvent(WishMovieModel.fromRecommended(
                              recommendedDataEntity!))),
                      deleteMovie: () => HomeBloc.get(context).add(
                          DeleteFromWishListEvent(
                              WishMovieModel.fromRecommended(
                                  recommendedDataEntity!))),
                      isWishMovie: state.wishListIds
                              ?.contains(recommendedDataEntity?.id) ??
                          false,
                      homeScreenStatus: state.homeScreenStatus)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.primary,
                          size: 25.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          (recommendedDataEntity?.voteAverage ?? 0).toString(),
                          style: AppStyles.movieTitleInListStyle,
                        )
                      ],
                    ),
                    Text(
                      ((recommendedDataEntity?.title?.length ?? 0) < 12)
                          ? recommendedDataEntity?.title ?? ""
                          : "${(recommendedDataEntity?.title ?? "").substring(0, 12)}...",
                      style: AppStyles.movieTitleInListStyle,
                    ),
                    Text(
                      recommendedDataEntity?.releaseDate ?? "",
                      style: AppStyles.dateStyle,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
