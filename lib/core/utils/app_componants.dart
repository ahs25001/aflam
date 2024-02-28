import 'package:aflame/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppComponents {
  static Widget addIcon() {
    return IconButton(
        onPressed: () {},
        icon: Stack(alignment: Alignment.center, children: [
          Icon(
            Icons.bookmark,
            size: 56.sp,
            color: AppColors.barColor.withOpacity(.7),
          ),
          Icon(
            Icons.add,
            size: 26.sp,
            color: Colors.white,
          )
        ]));
  }
}
