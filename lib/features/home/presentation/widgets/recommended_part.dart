import 'package:aflame/core/utils/app_colors.dart';
import 'package:aflame/core/utils/app_strings.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/RecommendedEntity.dart';
import 'package:aflame/features/home/presentation/widgets/recommended_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedPart extends StatelessWidget {
  RecommendedEntity? recommendedEntity;

  RecommendedPart(this.recommendedEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:10.h,horizontal: 20.w),
        color: AppColors.barColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.recommended,
              style: AppStyles.movieTitleStyle,
            ),
       // SizedBox(height: 15.h,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedEntity?.results?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: RecommendedItem(recommendedEntity?.results?[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
