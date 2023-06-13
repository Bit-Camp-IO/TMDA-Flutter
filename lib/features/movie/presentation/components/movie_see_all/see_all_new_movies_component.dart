import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_movie_card.dart';

class SeeAllNewMoviesComponent extends StatelessWidget {
  const SeeAllNewMoviesComponent({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.newMoviesState) {
          case BlocState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case BlocState.success:
            return ListView.builder(
              itemCount: state.newMovies.length,
              scrollDirection: Axis.vertical,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 100).r,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 14,
                    bottom: 16.0,
                  ).r,
                  child: SeeAllMovieCard(
                    onTap: () {
                      AutoRouter.of(context).push(
                        MovieDetailsWrapperRoute(
                          children: [
                            MovieDetailsRoute(
                              movieId: state.newMovies[index].movieId,
                            ),
                          ],
                        ),
                      );
                    },
                    title: state.newMovies[index].movieTitle,
                    posterPath: state.newMovies[index].moviePosterPath.isNotEmpty
                        ? ApiConstants.imageUrl(state.newMovies[index].moviePosterPath)
                        : AssetsManager.noPoster,
                    vote: state.newMovies[index].movieVote,
                    voteCount: state.newMovies[index].movieVoteCount,
                    genres: state.newMovies[index].movieGenres,
                    releaseYear: state.newMovies[index].movieReleaseDate,
                    language: state.newMovies[index].movieLanguage,
                  ),
                );
              },
            );
          case BlocState.failure:
            return const Center(
              child: Text('There Was an error'),
            );
        }
      },
    );
  }
}