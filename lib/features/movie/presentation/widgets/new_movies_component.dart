import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widget/custom_poster_card.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';

class NewMoviesComponent extends StatelessWidget {
  const NewMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.newMovies != current.newMovies,
      builder: (context, state) {
        switch (state.upComingMoviesState) {
          case BlocStateEnum.loading:
            return SizedBox(
              height: 270.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case BlocStateEnum.loaded:
            return SizedBox(
              height: 280.h,
              child: Animate(
                effects: [FadeEffect(duration: 250.ms)],
                child: ListView.builder(
                  itemCount: state.newMovies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 24.w),
                        CustomPosterCard(
                          onTap: () {
                            context.pushRoute(
                              MovieDetailsRoute(
                                movieId: state.newMovies[index].movieId
                                    .toString(),
                              ),
                            );
                          },
                          title: state.newMovies[index].movieTitle!,
                          imagePath:
                              state.newMovies[index].moviePosterPath!,
                          releaseYear: state
                              .newMovies[index].movieReleaseDate!
                              .substring(0, 4),
                          rating: state.newMovies[index].movieVote,
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          case (BlocStateEnum.error):
            return const Text('There was an error');
        }
      },
    );
  }
}