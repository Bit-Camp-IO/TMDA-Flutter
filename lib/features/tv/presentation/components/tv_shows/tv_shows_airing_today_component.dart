import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';

class TvShowsAiringTodayComponent extends StatelessWidget {
  const TvShowsAiringTodayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowsBloc, TvShowsState>(
      buildWhen: (previous, current) =>
          previous.airingTodayState != current.airingTodayState,
      builder: (context, state) {
        switch (state.airingTodayState) {
          case BlocState.loading:
            return SizedBox(
              height: 270.h,
              child: Center(
                child: Lottie.asset('assets/lottie/neon_loading.json'),
              ),
            );
          case BlocState.success:
            return Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: 'Airing Today',
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllTvShowsRoute(
                        tvShowType: TvShowType.airingToday,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 280.h,
                  child: ListView.builder(
                    itemCount: state.airingTodayTvShows.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 24.w),
                          PosterCard(
                            onTap: () {
                              context.pushRoute(
                                TvDetailsRoute(
                                  tvShowId:
                                      state.airingTodayTvShows[index].id,
                                ),
                              );
                            },
                            title: state.airingTodayTvShows[index].title,
                            imagePath: ApiConstants.imageUrl(
                                state.airingTodayTvShows[index].posterPath),
                            releaseDate:
                                state.airingTodayTvShows[index].firstAirDate,
                            rating: state.airingTodayTvShows[index].voteAverage,
                            genres: state.airingTodayTvShows[index].genres,
                            language: state.airingTodayTvShows[index].language,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          case (BlocState.failure):
            return const Text('There was an error');
        }
      },
    );
  }
}
