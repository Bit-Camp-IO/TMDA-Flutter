import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widget/poster_card.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularMovies.isEmpty ||
          previous.popularMovies[10] != current.popularMovies[10],
      builder: (context, state) {
        switch (state.popularMoviesState) {
          case BlocState.loading:
            return SizedBox(
              height: 270.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case BlocState.success:
            return SizedBox(
              height: 280.h,
              child: Animate(
                effects: [FadeEffect(duration: 250.ms)],
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 24.w),
                        PosterCard(
                          onTap: () {
                            context.pushRoute(
                              MovieDetailsRoute(
                                movieId: state.popularMovies[index].movieId,
                              ),
                            );
                          },
                          title: state.popularMovies[index].movieTitle,
                          imagePath: ApiConstants.imageUrl(state.popularMovies[index].moviePosterPath),
                          releaseDate: state.popularMovies[index].movieReleaseDate,
                          rating: state.popularMovies[index].movieVote,
                          genres: state.popularMovies[index].movieGenres,
                          language: state.popularMovies[index].movieLanguage,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          case BlocState.failure:
            return const Text('There Was an error');
        }
      },
    );
  }
}
