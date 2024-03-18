import 'package:aflame/features/home/presentation/widgets/carosular_slider_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/PopularEntity.dart';
import '../bloc/home_bloc.dart';

class PopularPart extends StatelessWidget {
  List<PopularDataEntity> popularMovies;

  PopularPart(this.popularMovies);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.homeScreenStatus == HomeScreenStatus.getPopularLoading) {
          print(state.homeScreenStatus);
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        } else {
          return CarouselSlider(
            items: popularMovies.map((e) => CarouselSliderItem(e)).toList(),
            options: CarouselOptions(
              height: 300.h,
              aspectRatio: 10 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
      },
    );
  }
}
