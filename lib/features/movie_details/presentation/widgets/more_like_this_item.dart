import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:aflame/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routs/routs.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_componants.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/MoreLikeThisEntity.dart';

class MoreLikeThisItem extends StatelessWidget {
MoreLikeThisDataEntity? moreLikeThisDataEntity;

MoreLikeThisItem(this.moreLikeThisDataEntity, {super.key});

  @override
Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Card(
          color: Theme.of(context).colorScheme.surface,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 200.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  // alignment: Alignment(-2.0.w, -1.5.h),
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.movieDetails,
                          arguments: moreLikeThisDataEntity?.id),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18.r),
                        child: CachedNetworkImage(
                          imageUrl: AppConstants.imageBaseUrl +
                              (moreLikeThisDataEntity?.posterPath ?? ""),
                          fit: BoxFit.fill,
                          width: 129.w,
                          height: 199.h,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    AppComponents.addIcon(
                        selectedColor: Theme.of(context).colorScheme.primary,
                        addMovie: () {
                          MovieDetailsBloc.get(context).add(
                              AddToWishListFromDetailsEvent(
                                  WishMovieModel.fromMoreLikeThis(
                                      moreLikeThisDataEntity!)));
                        },
                        deleteMovie: () {
                          MovieDetailsBloc.get(context).add(
                              DeleteFromWishListFromDetailsEvent(
                                  WishMovieModel.fromMoreLikeThis(
                                      moreLikeThisDataEntity!)));
                        },
                        isWishMovie: state.wishListIds
                                ?.contains(moreLikeThisDataEntity?.id) ??
                            false),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
                            (moreLikeThisDataEntity?.voteAverage ?? 0)
                                .toString(),
                            style: AppStyles.movieTitleInListStyle.copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                          )
                        ],
                      ),
                      Text(
                        ((moreLikeThisDataEntity?.title?.length ?? 0) < 12)
                            ? moreLikeThisDataEntity?.title ?? ""
                            : "${(moreLikeThisDataEntity?.title ?? "").substring(0, 12)}...",
                        style: AppStyles.movieTitleInListStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      Text(
                        moreLikeThisDataEntity?.releaseDate ?? "",
                        style: AppStyles.dateStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
