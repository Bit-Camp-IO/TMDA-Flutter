import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
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
                  final airingThisWeekTvShow = state.airingThisWeekTvShows[index];
                  return CarouselCard(
                    imagePath: airingThisWeekTvShow.posterPath,
                    errorImagePath: AssetsManager.errorPoster,
                    rating: airingThisWeekTvShow.voteAverage,
                    title: airingThisWeekTvShow.title,
                    voteCount: airingThisWeekTvShow.voteCount,
                    onTap: () {
                      context.pushRoute(TvDetailsRoute(tvShowId: airingThisWeekTvShow.id));
                    },
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
