import 'package:aflame/config/routs/routs.dart';
import 'package:aflame/core/utils/app_images.dart';
import 'package:aflame/core/utils/app_styles.dart';
import 'package:aflame/features/home/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  GenresCategoryEntity? genresCategoryEntity;

  CategoryItem(this.genresCategoryEntity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.movieDiscover,
          arguments: genresCategoryEntity),
      child: Container(
        width: 118.w,
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AppImages.categoryImage))),
        child: Center(
            child: Text(
          genresCategoryEntity?.name ?? "",
          style: AppStyles.movieTitleInListStyle.copyWith(
            color: Colors.white,
              fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
