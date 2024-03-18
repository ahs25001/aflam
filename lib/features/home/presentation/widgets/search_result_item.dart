import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/SearchResultEntity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  searchResultDataEntity?.title ?? "",
                  style: AppStyles.movieTitleInListStyle
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
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
