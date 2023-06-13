import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
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
      builder: (context, state) {
        switch (state.moviesLikeThisState) {
          case BlocState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case BlocState.success:
            return ListView.builder(
              itemCount: state.moviesLikeThis.length,
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
                              movieId: state.moviesLikeThis[index].id,
                            ),
                          ],
                        ),
                      );
                    },
                    title: state.moviesLikeThis[index].title,
                    posterPath: state.moviesLikeThis[index].posterPath.isNotEmpty
                            ? ApiConstants.imageUrl(state.moviesLikeThis[index].posterPath)
                            : AssetsManager.noPoster,
                    vote: state.moviesLikeThis[index].voteAverage,
                    voteCount: state.moviesLikeThis[index].movieVoteCount,
                    genres: state.moviesLikeThis[index].genres,
                    releaseYear: state.moviesLikeThis[index].releaseDate,
                    language: state.moviesLikeThis[index].language,
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
