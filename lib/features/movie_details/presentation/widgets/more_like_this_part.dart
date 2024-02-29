import 'package:aflame/core/utils/app_strings.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/movie_details/domain/entities/MoreLikeThisEntity.dart';
import 'package:aflame/features/movie_details/presentation/widgets/more_like_this_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreLikeThisPart extends StatelessWidget {
  MoreLikeThisEntity? moreLikeThisEntity;

  MoreLikeThisPart(this.moreLikeThisEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.moreLikeThis,
            style: AppStyles.movieTitleStyle.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 15.h,),
          SizedBox(
            height: 300.h,
              child: ListView.builder(
            itemCount: moreLikeThisEntity?.results?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                MoreLikeThisItem(moreLikeThisEntity?.results?[index]),
          )),

        ],
      ),
    );
  }
}
