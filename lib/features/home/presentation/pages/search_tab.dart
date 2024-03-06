import 'package:aflame/core/utils/app_jsons.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/presentation/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../bloc/home_bloc.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 29.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) =>
                      HomeBloc.get(context).add(SearchEvent(value)),
                  style: AppStyles.movieTitleInListStyle.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      ),
                  controller: HomeBloc.get(context).searchController,
                  cursorColor: Theme.of(context).colorScheme.primary,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.25),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white38),
                        borderRadius: BorderRadius.circular(39.r),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white38),
                        borderRadius: BorderRadius.circular(39.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white38),
                        borderRadius: BorderRadius.circular(39.r),
                      )),
                ),
                SizedBox(height: 15.h,),
                (state.homeScreenStatus == HomeScreenStatus.searchLoading)
                    ? Expanded(
                        child: Center(
                            child: Lottie.asset(AppJson.searchLoading,
                                height: 200.h, width: 200.w)),
                      )
                    : ((state.searchResultEntity?.results) != null &&
                            (state.searchResultEntity?.results ?? []).isEmpty)
                        ? Expanded(
                            child: Center(
                                child: Lottie.asset(
                              AppJson.notFound,
                              height: 200.h,
                              width: 200.w,
                            )),
                          )
                        : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                color: Theme.of(context).colorScheme.background,
                                endIndent: 10.w,
                                indent: 10.w,
                              ),
                              itemCount:
                                  state.searchResultEntity?.results?.length ??
                                      0,
                              itemBuilder: (context, index) => SearchResultItem(
                                  state.searchResultEntity?.results?[index]),
                            ),
                          )
              ],
            ),
          ),
        );
      },
    );
  }
}
