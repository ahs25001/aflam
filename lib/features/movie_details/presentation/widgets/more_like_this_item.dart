import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
    print("${moreLikeThisDataEntity?.id}+++++++++++++++++++++++++++++++++++");
    return Card(
      color: AppColors.cardColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 200.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment(-2.0.w, -1.5.h),
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
                // AppComponents.addIcon(),
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
                        (moreLikeThisDataEntity?.voteAverage ?? 0).toString(),
                        style: AppStyles.movieTitleInListStyle,
                      )
                    ],
                  ),
                  Text(
                    ((moreLikeThisDataEntity?.title?.length ?? 0) < 12)
                        ? moreLikeThisDataEntity?.title ?? ""
                        : "${(moreLikeThisDataEntity?.title ?? "").substring(0, 12)}...",
                    style: AppStyles.movieTitleInListStyle,
                  ),
                  Text(
                    moreLikeThisDataEntity?.releaseDate ?? "",
                    style: AppStyles.dateStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
