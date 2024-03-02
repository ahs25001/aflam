import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/SearchResultEntity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class SearchResultItem extends StatelessWidget {
  SearchResultDataEntity? searchResultDataEntity;

  SearchResultItem(this.searchResultDataEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.movieDetails,
          arguments: searchResultDataEntity?.id),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child: CachedNetworkImage(
              width: 146.w,
              height: 95.h,
              imageUrl: AppConstants.imageBaseUrl +
                  (searchResultDataEntity?.backdropPath ?? ""),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.primary,
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
                  searchResultDataEntity?.title ?? "",
                  style: AppStyles.movieTitleInListStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                searchResultDataEntity?.releaseDate ?? "",
                style: AppStyles.movieDescriptionStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
