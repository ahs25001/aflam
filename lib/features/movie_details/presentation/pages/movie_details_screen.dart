import 'package:aflame/config.dart';
import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_constants.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/movie_details/domain/use_cases/add_to_wish_list_from_details_use_case.dart';
import 'package:aflame/features/movie_details/domain/use_cases/delete_from_wish_list_from_details_use_case.dart';
import 'package:aflame/features/movie_details/domain/use_cases/get_%20wish_list_from_details_use_case.dart';
import 'package:aflame/features/movie_details/domain/use_cases/get_more_like_this_use_case.dart';
import 'package:aflame/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:aflame/features/movie_details/presentation/widgets/more_like_this_part.dart';
import 'package:aflame/features/movie_details/presentation/widgets/poster_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../bloc/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as int;
    return BlocProvider(
      create: (context) =>
      MovieDetailsBloc(
          getIt<GetMovieDetailsUseCase>(),
          getIt<GetMoreLikeThisUseCase>(),
          getIt<AddToWishListFromDetailsUseCase>(),
          getIt<DeleteFromWishListFromDetailsUseCse>(),
          getIt<GetWishListFromDetailsUseCase>())
        ..add(GetMovieDetailsEvent(args.toString()))..add(
          GetMoreLikeThisEvent(args.toString())),
      child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state.movieDetailsScreenStatus ==
              MovieDetailsScreenStatus.getDetailsError) {
            showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      content: Text(state.failures?.massage ?? "error"),
                    ));
          } else if (state.movieDetailsScreenStatus ==
              MovieDetailsScreenStatus.getMoreLikeThisSuccess ||
              state.movieDetailsScreenStatus ==
                  MovieDetailsScreenStatus.addToWishSuccess ||
              state.movieDetailsScreenStatus ==
                  MovieDetailsScreenStatus.deleteFromWishSuccess) {
            MovieDetailsBloc.get(context).add(GetIdsEvent());
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: (state.movieDetailsScreenStatus ==
                  MovieDetailsScreenStatus.loading)
                  ? Center(
                  child: CircularProgressIndicator(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ))
                  : SafeArea(
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    actions: [
                      InkWell(
                          onTap: () =>
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutes.home, (route) => false),
                          child: Icon(Icons.home, size: 30.sp,)),
                      SizedBox(width: 20.w,)
                    ],
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 15.h),
                      expandedTitleScale: 1.3,
                      background: CachedNetworkImage(
                        placeholder: (context, url) =>
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        imageUrl: AppConstants.imageBaseUrl +
                            (state.movieDetailsEntity?.backdropPath ??
                                ""),
                        width: double.infinity,
                        fit: BoxFit.fill,
                        // height: 220.h,
                      ),
                      title: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        state.movieDetailsEntity?.title ?? "",
                        style: AppStyles.movieDetailsTitleStyle.copyWith(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onSurface,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      )
                      ,),
                    expandedHeight: MediaQuery
                        .of(context)
                        .size
                        .height * 0.305,

                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([ SingleChildScrollView(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: (state.isFull ?? false)
                              ? (((state.movieDetailsEntity?.overview?.length ??
                              0) <=
                              340)
                              ? (((state.movieDetailsEntity?.overview
                              ?.length ??
                              0) <=
                              240)
                              ? (((state.movieDetailsEntity?.overview
                              ?.length ??
                              0) <=
                              140)
                              ? MediaQuery
                              .of(context)
                              .size
                              .height *
                              1
                              : MediaQuery
                              .of(context)
                              .size
                              .height *
                              1.10)
                              : MediaQuery
                              .of(context)
                              .size
                              .height * 1.20)
                              : ((state.movieDetailsEntity?.overview
                              ?.length ??
                              0) >=
                              500)
                              ? MediaQuery
                              .of(context)
                              .size
                              .height * 2
                              : MediaQuery
                              .of(context)
                              .size
                              .height * 1.30)
                              : (((state.movieDetailsEntity?.genres?.length ??
                              0) <=
                              3)
                              ? MediaQuery
                              .of(context)
                              .size
                              .height
                              : MediaQuery
                              .of(context)
                              .size
                              .height * 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CachedNetworkImage(
                              //   placeholder: (context, url) =>
                              //   const Center(
                              //     child: CircularProgressIndicator(
                              //       color: AppColors.primary,
                              //     ),
                              //   ),
                              //   errorWidget: (context, url, error) =>
                              //   const Icon(Icons.error),
                              //   imageUrl: AppConstants.imageBaseUrl +
                              //       (state.movieDetailsEntity?.backdropPath ??
                              //           ""),
                              //   width: double.infinity,
                              //   fit: BoxFit.fill,
                              //   height: 220.h,
                              // ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 18.0.w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      // Text(
                                      //   ((state.movieDetailsEntity?.title ?? "")
                                      //       .length <=
                                      //       27)
                                      //       ? state.movieDetailsEntity?.title ??
                                      //       ""
                                      //       : "${(state.movieDetailsEntity
                                      //       ?.title ?? "").substring(
                                      //       0, 27)}...",
                                      //   style: AppStyles.movieDetailsTitleStyle
                                      //       .copyWith(
                                      //       color: Theme
                                      //           .of(context)
                                      //           .colorScheme
                                      //           .onSurface,
                                      //       fontSize: 25.sp,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Text(
                                        state.movieDetailsEntity?.releaseDate ??
                                            "",
                                        style: AppStyles.movieDescriptionStyle
                                            .copyWith(fontSize: 15.sp),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      .movieDetailsEntity
                                                      ?.genres
                                                      ?.map((e) =>
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                              horizontal:
                                                              19.w,
                                                              vertical:
                                                              10.h),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  18.r),
                                                              border: Border
                                                                  .all(
                                                                  color: Colors
                                                                      .grey)),
                                                          child: Text(
                                                            e.name ?? "",
                                                            style: AppStyles
                                                                .movieDetailsTitleStyle
                                                                .copyWith(
                                                                fontSize:
                                                                15.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                                color: Theme
                                                                    .of(
                                                                    context)
                                                                    .colorScheme
                                                                    .onSurface),
                                                          )))
                                                      .toList() ??
                                                      [],
                                                ),
                                                SizedBox(
                                                  height: 12.h,
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      ExpandableText(
                                                        // onLinkTap: () => print(on),
                                                        onExpandedChanged:
                                                            (value) {
                                                          MovieDetailsBloc.get(
                                                              context)
                                                              .add(
                                                              ShowMoreEvent(
                                                                  value));
                                                        },
                                                        animation: true,
                                                        animationDuration:
                                                        const Duration(
                                                            milliseconds:
                                                            500),
                                                        textAlign:
                                                        TextAlign.start,
                                                        style: AppStyles
                                                            .movieTitleInListStyle
                                                            .copyWith(
                                                            color: Theme
                                                                .of(
                                                                context)
                                                                .colorScheme
                                                                .onSurface),
                                                        state.movieDetailsEntity
                                                            ?.overview ??
                                                            "",
                                                        expandText:
                                                        AppStrings.showMore,
                                                        collapseText:
                                                        AppStrings.showLess,
                                                        maxLines: 3,
                                                        linkColor:
                                                        Theme
                                                            .of(context)
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: AppColors.primary,
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text(
                                                      (state.movieDetailsEntity
                                                          ?.voteAverage ??
                                                          0)
                                                          .toString(),
                                                      style: AppStyles
                                                          .movieTitleInListStyle
                                                          .copyWith(
                                                          color: Theme
                                                              .of(
                                                              context)
                                                              .colorScheme
                                                              .onSurface),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      MoreLikeThisPart(
                                          state.moreLikeThisEntity),
                                    ],
                                  ),
                                ),
                              ),
                              // Spacer(flex:1,)
                            ],
                          ),
                        ),
                      )
                      ]))
                ],),
              ));
        },
      ),
    );
  }
}
