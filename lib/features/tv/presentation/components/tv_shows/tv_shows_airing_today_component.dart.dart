import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows_carousel_card.dart';

class TvShowsAiringTodayComponent extends StatelessWidget {
  const TvShowsAiringTodayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TvShowsBloc, TvShowsState>(
          buildWhen: (previous, current) =>
              previous.airingTodayState != current.airingTodayState,
          builder: (context, state) {
            switch (state.airingTodayState) {
              case BlocState.loading:
                return SizedBox(
                  height: 410.h,
                  child: Center(
                    child: Lottie.asset('assets/lottie/neon_loading.json'),
                  ),
                );
              case BlocState.success:
                return Column(
                  children: [
                    CarouselSlider.builder(
                      itemCount: state.airingTodayTvShows.length,
                      itemBuilder: (context, index, realIndex) {
                        return TvShowCarouselCard(
                          onTap: () {
                            AutoRouter.of(context).push(
                              TvShowDetailsWrapperRoute(
                                children: [
                                  TvDetailsRoute(
                                    tvShowId: state.airingTodayTvShows[index].tvShowId
                                  ),
                                ],
                              ),
                            );
                          },
                          imagePath: ApiConstants.imageUrl(
                            state.airingTodayTvShows[index].posterPath,
                          ),
                          rating: state.airingTodayTvShows[index].voteAverage,
                          title: state.airingTodayTvShows[index].title,
                          voteCount: state.airingTodayTvShows[index].voteCount,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        height: 410.h,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              case BlocState.failure:
                return const Text('>>>>>> Error <<<<<');
            }
          },
        ),
      ],
    );
  }
}
