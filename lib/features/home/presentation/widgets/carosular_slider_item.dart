import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/PopularEntity.dart';
import 'package:aflame/features/home/presentation/widgets/new_releases_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderItem extends StatelessWidget {
  PopularDataEntity resultsEntity;

  CarouselSliderItem(this.resultsEntity);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  AppConstants.imageBaseUrl + (resultsEntity.backdropPath ?? ""),
              fit: BoxFit.fill,
              width: 412.w,
              height: 217.h,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Container(
                color: AppColors.barColor,
              ),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 21.w),
                child:NewReleasesItem(resultsEntity: resultsEntity,)

              ),
            ),
            SizedBox(
              width: 14.w,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((resultsEntity.title ?? "null").length < 14)
                      ? resultsEntity.title ?? "null"
                      : "${(resultsEntity.title ?? "null").substring(0, 14)}....",
                  style: AppStyles.movieTitleInListStyle.copyWith(fontSize: 17.sp,fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h,),
                Text(resultsEntity.releaseDate??"",style: AppStyles.movieDescriptionStyle,)
              ],
            ),
          ],
        )
      ],
    );
  }
}
