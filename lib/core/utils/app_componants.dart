import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/features/home/presentation/bloc/home_bloc.dart';
import 'package:aflame/features/movi_descover/presentation/bloc/movie_discover_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppComponents {
  static Widget addIcon(
      {required void Function() addMovie,
      required void Function() deleteMovie,
      required bool isWishMovie,
      HomeScreenStatus? homeScreenStatus,
      MovieDiscoverScreenStatus? movieDiscoverScreenStatus}) {
    // if (!isWishMovie) {
    //   isWishMovie = homeScreenStatus == HomeScreenStatus.addToWishSuccess ||
    //       movieDiscoverScreenStatus ==
    //           MovieDiscoverScreenStatus.addToWishSuccess;
    // }
    return IconButton(
        onPressed: () {
          if (isWishMovie) {
            deleteMovie();
          } else {
            addMovie();
          }
        },
        icon: Stack(alignment: Alignment.center, children: [
          (homeScreenStatus == HomeScreenStatus.addToWishLoading ||
                  movieDiscoverScreenStatus ==
                      MovieDiscoverScreenStatus.addToWishLoading)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : Icon(
                  Icons.bookmark,
                  size: 56.sp,
                  color: (isWishMovie)
                      ? AppColors.primary
                      : AppColors.barColor.withOpacity(.7),
                ),
          Icon(
            (isWishMovie) ? Icons.done : Icons.add,
            size: 26.sp,
            color: Colors.white,
          )
        ]));
  }
}
