import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_movie_card.dart';

class SeeAllMoviesLikeThisComponent extends StatelessWidget {
  const SeeAllMoviesLikeThisComponent({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) => previous.movieDetails.similarMovies != current.movieDetails.similarMovies,
      builder: (context, state) {
            return ListView.builder(
              itemCount: state.movieDetails.similarMovies.length,
              scrollDirection: Axis.vertical,
              controller: scrollController,
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
                              movieId: state.movieDetails.similarMovies[index].id,
                            ),
                          ],
                        ),
                      );
                    },
                    title: state.movieDetails.similarMovies[index].title,
                    posterPath: state.movieDetails.similarMovies[index].posterPath.isNotEmpty
                            ? ApiConstants.imageUrl(state.movieDetails.similarMovies[index].posterPath)
                            : AssetsManager.noPoster,
                    vote: state.movieDetails.similarMovies[index].voteAverage,
                    voteCount: state.movieDetails.similarMovies[index].movieVoteCount,
                    genres: state.movieDetails.similarMovies[index].genres,
                    releaseYear: state.movieDetails.similarMovies[index].releaseDate,
                    language: state.movieDetails.similarMovies[index].language,
                  ),
                );
              },
            );

      },
    );
  }
}
