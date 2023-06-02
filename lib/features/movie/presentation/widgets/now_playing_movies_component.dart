import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/presentation/bloc/dot_indicator/dot_indicator_cubit.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:tmda/core/widget/carousel_item_view.dart';
import 'package:tmda/core/widget/custom_animated_indicator.dart';

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
              case BlocStateEnum.loading:
                return SizedBox(
                  height: 410.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              case BlocStateEnum.loaded:
                return Stack(
                  children: [
                    Animate(
                      effects: [FadeEffect(duration: 150.ms)],
                      child: CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (context, index, realIndex) {
                          return CarouselItemView(
                            imagePath:
                                state.nowPlayingMovies[index].moviePosterPath!,
                            productionCompany: 'Marvel Studios',
                            rating: state.nowPlayingMovies[index].movieVote!,
                            releaseYear:
                                state.nowPlayingMovies[index].movieReleaseDate!,
                            title: state.nowPlayingMovies[index].movieTitle!,
                            voteCount:
                                state.nowPlayingMovies[index].movieVoteCount!,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          viewportFraction: 1,
                          height: 410.h,
                          onPageChanged: (index, reason) {
                            BlocProvider.of<DotIndicatorCubit>(context)
                                .changeIndicatorIndex(index);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              case BlocStateEnum.error:
                return const Text('>>>>>> Error <<<<<');
            }
          },
        ),
        SizedBox(height: 14.h),
        BlocBuilder<DotIndicatorCubit, DotIndicatorState>(
          builder: (context, state) {
            return CustomAnimatedIndicator(
              currentIndex: state.index,
              dotsCount: 4,
              axisDirection: Axis.horizontal,
            );
          },
        ),
      ],
    );
  }
}
