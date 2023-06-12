import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/core/widget/carousel_card.dart';
import 'package:tmda/core/widget/animated_indicator.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
  const NowPlayingMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MoviesBloc, MoviesState>(
          buildWhen: (previous, current) =>
              previous.nowPlayingState != current.nowPlayingState,
          builder: (context, state) {
            switch (state.nowPlayingState) {
              case BlocState.loading:
                return SizedBox(
                  height: 410.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              case BlocState.success:
                return Stack(
                  children: [
                    Animate(
                      effects: [FadeEffect(duration: 150.ms)],
                      child: CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (context, index, realIndex) {
                          return CarouselCard(
                            imagePath: ApiConstants.imageUrl(
                              state.nowPlayingMovies[index].moviePosterPath,
                            ),
                            rating: state.nowPlayingMovies[index].movieVote,
                            title: state.nowPlayingMovies[index].movieTitle,
                            voteCount:
                                state.nowPlayingMovies[index].movieVoteCount,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          viewportFraction: 1,
                          height: 410.h,
                          onPageChanged: (index, reason) {
                            BlocProvider.of<MoviesBloc>(context).add(
                              ChangeIndicatorIndexEvent(index),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              case BlocState.failure:
                return const Text('>>>>>> Error <<<<<');
            }
          },
        ),
        SizedBox(height: 14.h),
        BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            return AnimatedIndicator(
              currentIndex: state.indicatorIndex,
              dotsCount: 4,
              axisDirection: Axis.horizontal,
            );
          },
        ),
      ],
    );
  }
}
