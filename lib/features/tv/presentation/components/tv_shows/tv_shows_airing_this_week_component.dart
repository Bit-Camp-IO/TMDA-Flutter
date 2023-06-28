import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/carousel_card.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';

class TvShowsAiringThisWeekComponent extends StatelessWidget {
  const TvShowsAiringThisWeekComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TvShowsBloc, TvShowsState>(
          buildWhen: (previous, current) =>
              previous.airingThisWeekState != current.airingThisWeekState,
          builder: (context, state) {
            switch (state.airingThisWeekState) {
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
                      itemCount: state.airingThisWeekTvShows.length,
                      itemBuilder: (context, index, realIndex) {
                        return CarouselCard(
                          imagePath: ApiConstants.imageUrl(
                            state.airingThisWeekTvShows[index].posterPath,
                          ),
                          rating:
                              state.airingThisWeekTvShows[index].voteAverage,
                          title: state.airingThisWeekTvShows[index].title,
                          voteCount:
                              state.airingThisWeekTvShows[index].voteCount,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: false,
                        viewportFraction: 1,
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
