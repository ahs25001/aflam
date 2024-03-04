import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/data/models/WishMovieModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_bloc.dart';

class WishListItem extends StatelessWidget {
  WishMovieModel? wishMovieModel;

  WishListItem(this.wishMovieModel);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, AppRoutes.movieDetails,
              arguments: wishMovieModel?.id),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: CachedNetworkImage(
                  width: 150.w,
                  height: 99.h,
                  fit: BoxFit.cover,
                  imageUrl:
                      AppConstants.imageBaseUrl + (wishMovieModel?.image ?? ""),
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primary,
                  )),
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
                      wishMovieModel?.title ?? "",
                      style: AppStyles.movieTitleInListStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    wishMovieModel?.date ?? "",
                    style: AppStyles.movieDescriptionStyle,
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                  onTap: () => HomeBloc.get(context)
                      .add(DeleteFromWishListEvent(wishMovieModel!)),
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.primary,
                  ))
            ],
          ),
        );
      },
    );
  }
}
