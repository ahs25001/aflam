import 'package:aflame/core/utils/app_strings.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_bloc.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return (state.homeScreenStatus == HomeScreenStatus.getCategoriesLoading)
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.browseCategory,
                      style: AppStyles.categoryTitleStyle.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.categoryEntity?.genres?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 38.w,
                            mainAxisSpacing: 38.h),
                        itemBuilder: (context, index) =>
                            CategoryItem(state.categoryEntity?.genres?[index]),
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
