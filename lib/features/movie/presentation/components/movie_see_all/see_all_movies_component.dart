import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/movie/presentation/bloc/see_all_movies/see_all_movies_bloc.dart';
import 'package:tmda/core/widgets/list_card_with_save.dart';

class SeeAllMoviesComponent extends StatefulWidget {
  const SeeAllMoviesComponent({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  final ScrollController scrollController;

  @override
  State<SeeAllMoviesComponent> createState() => _SeeAllMoviesComponentState();
}

class _SeeAllMoviesComponentState extends State<SeeAllMoviesComponent>
    with AutoRouteAwareStateMixin<SeeAllMoviesComponent> {
  late int tappedMovieId;

  @override
  void didPopNext() {
    context.read<SeeAllMoviesBloc>()
      ..add(CheckForMovieStatesEvent(tappedMovieId))
      ..add(CheckForMoviesListStatesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllMoviesBloc, SeeAllMoviesState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.seeAllMovies.length + 1,
          scrollDirection: Axis.vertical,
          controller: widget.scrollController,
          padding: const EdgeInsets.symmetric(vertical: 100).r,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return index >= state.seeAllMovies.length
                ? Center(
                    child: Lottie.asset(AssetsManager.neonLoading, width: 200),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 14,
                    ).r,
                    child: BlocBuilder<SeeAllMoviesBloc, SeeAllMoviesState>(
                      buildWhen: (previous, current) =>
                          previous.seeAllMovies[index].accountStates !=
                          current.seeAllMovies[index].accountStates,
                      builder: (context, state) {
                        return ListCardWithSave(
                          onTap: () {
                            tappedMovieId = state.seeAllMovies[index].id;
                            context.pushRoute(
                              MovieDetailsRoute(
                                movieId: state.seeAllMovies[index].id,
                              ),
                            );
                          },
                          title: state.seeAllMovies[index].title,
                          errorImagePath: AssetsManager.noPoster,
                          posterPath: state.seeAllMovies[index].posterPath,
                          vote: state.seeAllMovies[index].voteAverage,
                          voteCount: state.seeAllMovies[index].movieVoteCount,
                          genres: state.seeAllMovies[index].genres,
                          releaseYear: state.seeAllMovies[index].releaseDate,
                          language: state.seeAllMovies[index].language,
                          isInWatchList: state
                              .seeAllMovies[index].accountStates.inWatchList,
                          onSaved: () {
                            context.read<SeeAllMoviesBloc>().add(
                                  AddOrRemoveFromWatchListEvent(
                                    isInWatchList: !state.seeAllMovies[index]
                                        .accountStates.inWatchList,
                                    movieId: state.seeAllMovies[index].id,
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  );
          },
        );
      },
    );
  }
}
