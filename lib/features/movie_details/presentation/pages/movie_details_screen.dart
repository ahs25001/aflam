import 'package:aflame/config.dart';
import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:aflame/features/movie_details/presentation/widgets/poster_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as int;
    return BlocProvider(
      create: (context) => MovieDetailsBloc(getIt<GetMovieDetailsUseCase>())
        ..add(GetMovieDetailsEvent(args.toString() ?? "")),
      child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state.movieDetailsScreenStatus ==
              MovieDetailsScreenStatus.getDetailsError) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Text(state.failures?.massage ?? "error"),
                    ));
          }
        },
        builder: (context, state) {
          return (state.movieDetailsScreenStatus ==
                  MovieDetailsScreenStatus.loading)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : Scaffold(
                  backgroundColor: AppColors.appBackGround,
                  appBar: AppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: AppColors.appBackGround,
                    title: Text(
                      state.movieDetailsEntity?.title ?? "",
                      style: AppStyles.movieDetailsTitleStyle,
                    ),
                    centerTitle: true,
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: AppConstants.imageBaseUrl +
                              (state.movieDetailsEntity?.backdropPath ?? ""),
                          width: double.infinity,
                          fit: BoxFit.fill,
                          height: 220.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ((state.movieDetailsEntity?.title ?? "")
                                            .length <=
                                        27)
                                    ? state.movieDetailsEntity?.title ?? ""
                                    : "${(state.movieDetailsEntity?.title ?? "").substring(0, 27)}...",
                                style: AppStyles.movieDetailsTitleStyle,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                state.movieDetailsEntity?.releaseDate ?? "",
                                style: AppStyles.movieDescriptionStyle
                                    .copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PosterItem(state.movieDetailsEntity),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 6.w,
                                          runSpacing: 6.h,
                                          children: state
                                                  .movieDetailsEntity?.genres
                                                  ?.map((e) => Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 19.w,
                                                              vertical: 10.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      18.r),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey)),
                                                      child: Text(
                                                        e.name ?? "",
                                                        style: AppStyles
                                                            .movieTitleInListStyle,
                                                      )))
                                                  .toList() ??
                                              [],
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        ExpandableText(
                                          animation: true,
                                          animationDuration:
                                              const Duration(milliseconds: 500),
                                          textAlign: TextAlign.start,
                                          style: AppStyles.movieTitleStyle,
                                          state.movieDetailsEntity?.overview ??
                                              "",
                                          expandText: 'show more',
                                          collapseText: 'show less',
                                          maxLines: 4,
                                          linkColor: AppColors.primary,
                                        ),
                                        // AnimatedContainer(
                                        //   duration: const Duration(seconds: 1),
                                        //   width: double.infinity,
                                        //   child: Text(
                                        //     textAlign: TextAlign.start,
                                        //     state.movieDetailsEntity?.overview ??
                                        //         "",
                                        //     style: AppStyles.movieTitleStyle,
                                        //     maxLines:null,
                                        //     overflow: null,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}
