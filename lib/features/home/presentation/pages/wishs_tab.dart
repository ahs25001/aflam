import 'package:aflame/core/utils/app_strings.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../bloc/home_bloc.dart';

@injectable
class WishesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Text(
                AppStrings.watchlist,
                style: AppStyles.categoryTitleStyle.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      WishListItem(state.wishList?[index]),
                  itemCount: state.wishList?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) {
                    return  Divider(
                      color: Theme.of(context).colorScheme.background,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
