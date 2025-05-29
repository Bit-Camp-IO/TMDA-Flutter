import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class SeeAllMoviesWatchListComponent extends StatefulWidget {
  final ScrollController scrollController;
  const SeeAllMoviesWatchListComponent(
      {super.key, required this.scrollController});

  @override
  State<SeeAllMoviesWatchListComponent> createState() =>
      _SeeAllMoviesWatchListComponentState();
}

class _SeeAllMoviesWatchListComponentState
    extends State<SeeAllMoviesWatchListComponent> {
  _checkCurrentScrollPosition() {
    final double maxScroll = widget.scrollController.position.maxScrollExtent;
    final double currentScroll = widget.scrollController.offset;
    if (currentScroll == maxScroll) {
      context.read<WatchListBloc>().add(
            const ChangeMoviesWatchListViewScrollState(
              isMoviesWatchListViewHasReachedMaxScroll: true,
            ),
          );
    }
  }

  @override
  void initState() {
    widget.scrollController.addListener(_checkCurrentScrollPosition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchListBloc, WatchListState>(
      listener: (context, state) {
        if (state.moviesWatchList.isEmpty) {
          context.router.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.moviesWatchList != current.moviesWatchList,
      builder: (context, state) {
        return CustomFadeAnimation(
          duration: Duration(milliseconds: 400),
          child: ListView.builder(
            itemCount: state.moviesWatchList.length,
            controller: widget.scrollController,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 100).r,
            itemBuilder: (context, index) {
              final movie = state.moviesWatchList[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 14,
                  bottom: 16.0,
                ).r,
                child: Dismissible(
                  key: ObjectKey(movie.id),
                  resizeDuration: const Duration(milliseconds: 200),
                  onDismissed: (direction) => context.read<WatchListBloc>().add(
                        AddOrRemoveMovieFromWatchListEvent(
                          movieId: movie.id,
                          isInWatchList: false,
                        ),
                      ),
                  child: ListCard(
                    title: movie.title,
                    posterPath: movie.posterPath,
                    errorImagePath: AssetsManager.errorPoster,
                    vote: movie.voteAverage,
                    voteCount: movie.voteCount,
                    genres: movie.genres,
                    releaseYear: movie.releaseDate,
                    language: movie.language,
                    onTap: () {
                      context.pushRoute(
                        MovieDetailsRoute(
                          movieId: movie.id,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(_checkCurrentScrollPosition);
  }
}
