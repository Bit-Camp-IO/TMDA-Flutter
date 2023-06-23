import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_movie_card.dart';

class SeeAllTopRatedMoviesComponent extends StatelessWidget {
  const SeeAllTopRatedMoviesComponent({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return ListView.builder(
          controller: scrollController,
          itemCount: state.topRatedMovies.length,
          scrollDirection: Axis.vertical,
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
                          movieId: state.topRatedMovies[index].id,
                        ),
                      ],
                    ),
                  );
                },
                title: state.topRatedMovies[index].title,
                posterPath: state.topRatedMovies[index].posterPath.isNotEmpty
                    ? ApiConstants.imageUrl(
                        state.topRatedMovies[index].posterPath)
                    : AssetsManager.noPoster,
                vote: state.topRatedMovies[index].voteAverage,
                voteCount: state.topRatedMovies[index].movieVoteCount,
                genres: state.topRatedMovies[index].genres,
                releaseYear: state.topRatedMovies[index].releaseDate,
                language: state.topRatedMovies[index].language,
              ),
            );
          },
        );
      },
    );
  }
}
