import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/route_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widget/custom_poster_card.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';

class UpcomingMoviesComponent extends StatelessWidget {
  const UpcomingMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.upComingMovies != current.upComingMovies,
      builder: (context, state) {
        switch (state.upComingMoviesState) {
          case BlocStateEnum.loading:
            return SizedBox(
              height: 273.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case (BlocStateEnum.loaded):
            return SizedBox(
              height: 270.h,
              child: Animate(
                effects: [FadeEffect(duration: 250.ms)],
                child: ListView.builder(
                  itemCount: state.upComingMovies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 24.w),
                        CustomPosterCard(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRouter.movieDetailsRoute,
                              arguments: state.upComingMovies[index].movieId,
                            );
                          },
                          title: state.upComingMovies[index].movieTitle!,
                          imagePath:
                              state.upComingMovies[index].moviePosterPath!,
                          releaseYear: state
                              .upComingMovies[index].movieReleaseDate!
                              .substring(0, 4),
                          rating: state.upComingMovies[index].movieVote,
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
