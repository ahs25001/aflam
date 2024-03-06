import 'package:aflame/config.dart';
import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/CategoryEntity.dart';
import 'package:aflame/features/movi_descover/domain/use_cases/get_movie_discover_use_case.dart';
import 'package:aflame/features/movi_descover/presentation/widgets/movie_dicover_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/movie_discover_bloc.dart';

class MovieDiscoverScreen extends StatelessWidget {
  const MovieDiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as GenresCategoryEntity;
    return BlocProvider(
      create: (context) => MovieDiscoverBloc(getIt<GetMovieDiscoverUseCase>())
        ..add(GetMovieDiscoverEvent(args.id.toString())),
      child: BlocConsumer<MovieDiscoverBloc, MovieDiscoverState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                args.name ?? "",
                  style: AppStyles.movieDetailsTitleStyle.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold)),
            ),
            body: (state.movieDiscoverScreenStatus ==
                    MovieDiscoverScreenStatus.getMovieDiscoverLoading)
                ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                                    ),
                )
                : Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 18.0.w),
                  child: ListView.separated(
                      itemBuilder: (context, index) => MovieDiscoverItem(
                          state.movieDiscoverEntity?.results?[index]),
                      separatorBuilder: (context, index) => Divider(
                        color: Theme.of(context).colorScheme.background,
                              endIndent: 10.w,
                              indent: 10.w,
                            ),
                      itemCount: state.movieDiscoverEntity?.results?.length ?? 0),
                ),
          );
        },
      ),
    );
  }
}
