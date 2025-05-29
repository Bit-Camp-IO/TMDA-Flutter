import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class SeeAllTvShowsWatchListComponent extends StatefulWidget {
  final ScrollController scrollController;
  const SeeAllTvShowsWatchListComponent(
      {super.key, required this.scrollController});

  @override
  State<SeeAllTvShowsWatchListComponent> createState() =>
      _SeeAllTvShowsWatchListComponentState();
}

class _SeeAllTvShowsWatchListComponentState
    extends State<SeeAllTvShowsWatchListComponent> {
  _checkCurrentScrollPosition() {
    final double maxScroll = widget.scrollController.position.maxScrollExtent;
    final double currentScroll = widget.scrollController.offset;
    if (currentScroll == maxScroll) {
      context.read<WatchListBloc>().add(
            const ChangeTvShowsWatchListViewScrollState(
              isTvShowsWatchListViewHasReachedMaxScroll: true,
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
        if (state.tvShowsWatchList.isEmpty) {
          context.router.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.tvShowsWatchList != current.tvShowsWatchList,
      builder: (context, state) {
        return CustomFadeAnimation(
          duration: Duration(milliseconds: 400),
          child: ListView.builder(
            itemCount: state.tvShowsWatchList.length,
            controller: widget.scrollController,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 100).r,
            itemBuilder: (context, index) {
              final tvShow = state.tvShowsWatchList[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 14,
                  bottom: 16.0,
                ).r,
                child: Dismissible(
                  key: ObjectKey(tvShow.id),
                  resizeDuration: const Duration(milliseconds: 200),
                  onDismissed: (direction) => context.read<WatchListBloc>().add(
                        AddOrRemoveTvShowFromWatchListEvent(
                          tvShowId: tvShow.id,
                          isInWatchList: false,
                        ),
                      ),
                  child: ListCard(
                    title: tvShow.title,
                    errorImagePath: AssetsManager.errorPoster,
                    posterPath: tvShow.posterPath,
                    vote: tvShow.voteAverage,
                    voteCount: tvShow.voteCount,
                    genres: tvShow.genres,
                    releaseYear: tvShow.firstAirDate,
                    language: tvShow.language,
                    onTap: () {
                      context.pushRoute(
                        TvDetailsRoute(tvShowId: tvShow.id),
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
    widget.scrollController.removeListener(_checkCurrentScrollPosition);
    super.dispose();
  }
}
