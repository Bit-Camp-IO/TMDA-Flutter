import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/route_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widget/custom_poster_card.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedMovies != current.topRatedMovies,
      builder: (context, state) {
        switch (state.topRatedState) {
          case BlocStateEnum.loading:
            return const SizedBox(
              height: 250,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case BlocStateEnum.loaded:
            return SizedBox(
              height: 270.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.topRatedMovies.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 24.w),
                      CustomPosterCard(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              AppRouter.movieDetailsRoute,
                              arguments: state.topRatedMovies[index].movieId,
                            );
                        },
                        title: state.topRatedMovies[index].movieTitle!,
                        imagePath: state.topRatedMovies[index].moviePosterPath!,
                        releaseYear: state
                            .topRatedMovies[index].movieReleaseDate!
                            .substring(0, 4),
                        rating: state.topRatedMovies[index].movieVote,
                      ),
                    ],
                  );
                },
              ),
            );
          case BlocStateEnum.error:
            return const Text('There was an error');
        }
      },
    );
  }
}
