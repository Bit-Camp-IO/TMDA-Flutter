import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/route_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widget/custom_poster_card.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';

class PopularMoviesComponent extends StatefulWidget {
  const PopularMoviesComponent({super.key});

  @override
  State<PopularMoviesComponent> createState() => _PopularMoviesComponentState();
}

class _PopularMoviesComponentState extends State<PopularMoviesComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.popularMovies != current.popularMovies,
      builder: (context, state) {
        switch (state.popularState) {
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
                itemCount: state.popularMovies.length,
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
                              arguments: state.popularMovies[index].movieId,
                            );
                        },
                        title: state.popularMovies[index].movieTitle!,
                        imagePath: state.popularMovies[index].moviePosterPath!,
                        releaseYear: state.popularMovies[index].movieReleaseDate!
                            .substring(0, 4),
                        rating: state.popularMovies[index].movieVote,
                      ),
                    ],
                  );
                },
              ),
            );
          case BlocStateEnum.error:
            return const Text('There Was an error');
        }
      },
    );
  }
}
