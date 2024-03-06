import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_componants.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../home/data/models/WishMovieModel.dart';
import '../../domain/entities/MovieDetailsEntity.dart';
import '../bloc/movie_details_bloc.dart';

class PosterItem extends StatelessWidget {
  MovieDetailsEntity? movieDetailsEntity;

  PosterItem(this.movieDetailsEntity);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          // alignment: Alignment(-2.0.w, -1.5.h),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: CachedNetworkImage(
                imageUrl: AppConstants.imageBaseUrl +
                    (movieDetailsEntity?.posterPath ?? ""),
                fit: BoxFit.fill,
                width: 129.w,
                height: 199.h,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            AppComponents.addIcon(
              selectedColor: Theme.of(context).colorScheme.primary,
                addMovie: () {
                  MovieDetailsBloc.get(context).add(
                      AddToWishListFromDetailsEvent(
                          WishMovieModel.fromMovieDetails(
                              movieDetailsEntity!)));
                },
                deleteMovie: () {
                  MovieDetailsBloc.get(context).add(
                      DeleteFromWishListFromDetailsEvent(
                          WishMovieModel.fromMovieDetails(
                              movieDetailsEntity!)));
                },
                isWishMovie: state.wishListIds
                    ?.contains(movieDetailsEntity?.id) ??
                    false),
          ],
        );
      },
    );
  }
}
