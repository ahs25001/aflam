import 'package:aflame/features/movi_descover/domain/entities/MoveDiscoverEntity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routs/routs.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_styles.dart';

class MovieDiscoverItem extends StatelessWidget {
  MovieDiscoverDataEntity? movieDiscoverDataEntity;

  MovieDiscoverItem(this.movieDiscoverDataEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.movieDetails,
          arguments: movieDiscoverDataEntity?.id),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: CachedNetworkImage(
              width: 146.w,
              height: 95.h,
              imageUrl: AppConstants.imageBaseUrl +
                  (movieDiscoverDataEntity?.backdropPath ?? ""),
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
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160.w,
                child: Text(
                  movieDiscoverDataEntity?.title ?? "",
                  style: AppStyles.movieDetailsTitleStyle.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                movieDiscoverDataEntity?.releaseDate ?? "",
                style: AppStyles.movieDescriptionStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
