import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/widgets/carousel_card.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';

class TvShowsAiringThisWeekComponent extends StatelessWidget {
  const TvShowsAiringThisWeekComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            return CarouselSlider.builder(
              itemCount: state.airingThisWeekTvShows.length,
              itemBuilder: (context, index, realIndex) {
                if (state.airingThisWeekTvShows.isNotEmpty) {
                  return CarouselCard(
                    onTap: () {
                      context.pushRoute(TvDetailsRoute(tvShowId: state.airingThisWeekTvShows[index].id));
                    },
                    imagePath: ApiConstants.imageUrl(
                      state.airingThisWeekTvShows[index].posterPath,
                    ),
                    rating: state.airingThisWeekTvShows[index].voteAverage,
                    title: state.airingThisWeekTvShows[index].title,
                    voteCount: state.airingThisWeekTvShows[index].voteCount,
                  );
                } else {
                  return const SizedBox();
                }
              },
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 1,
                height: 410.h,
              ),
            );
          },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
