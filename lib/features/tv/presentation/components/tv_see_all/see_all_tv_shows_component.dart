import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/list_card_with_save.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows_bloc/see_all_tv_shows_bloc.dart';

class SeeAllTvShowsComponent extends StatefulWidget {
  const SeeAllTvShowsComponent(
      {super.key, this.tvShowId, required this.tvShowType});

  final int? tvShowId;
  final TvShowType tvShowType;

  @override
  State<SeeAllTvShowsComponent> createState() => _SeeAllTvShowsComponentState();
}

class _SeeAllTvShowsComponentState extends State<SeeAllTvShowsComponent> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final seeAllBloc = context.read<SeeAllTvShowsBloc>();
    if (currentScroll >= maxScroll * 0.9) {
      switch (widget.tvShowType) {
        case (TvShowType.airingToday):
          seeAllBloc.add(GetAllAiringTodayTvShowsEvent());
        case (TvShowType.popularTvShows):
          seeAllBloc.add(GetAllPopularTvShowsEvent());
        case (TvShowType.topRatedTvShows):
          seeAllBloc.add(GetAllTopRatedTvShowsEvent());
        case (TvShowType.similarTvShows):
          seeAllBloc.add(GetAllSimilarTvShowsEvent(tvShowId: widget.tvShowId!));
        case (TvShowType.recommendedTvShows):
          seeAllBloc
              .add(GetAllRecommendedTvShowsEvent(tvShowId: widget.tvShowId!));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeeAllTvShowsBloc, SeeAllTvShowsState>(
      buildWhen: (previous, current) =>
          previous.seeAllTvShows != current.seeAllTvShows,
      builder: (context, state) {
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.seeAllTvShows.length + 1,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 100).r,
          itemBuilder: (context, index) {
            if (index >= state.seeAllTvShows.length) {
              return Center(
                child: Lottie.asset(AssetsManager.neonLoading, width: 200.w),
              );
            } else {
              final tvShow = state.seeAllTvShows[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 14,
                  bottom: 16.0,
                ).r,
                child: BlocBuilder<WatchListBloc, WatchListState>(
                  builder: (context, state) {
                    final bool isInWatchList =
                        state.tvShowsWatchListIdsSet.contains(tvShow.id);
                    return ListCardWithSave(
                      onTap: () {
                        context.pushRoute(
                          TvDetailsRoute(
                            tvShowId: tvShow.id,
                          ),
                        );
                      },
                      title: tvShow.title,
                      errorImagePath: AssetsManager.errorPoster,
                      posterPath: tvShow.posterPath,
                      vote: tvShow.voteAverage,
                      voteCount: tvShow.voteCount,
                      genres: tvShow.genres,
                      releaseYear: tvShow.firstAirDate,
                      language: tvShow.language,
                      isInWatchList: isInWatchList,
                      onSaved: () {
                        context.read<WatchListBloc>().add(
                            AddOrRemoveTvShowFromWatchListEvent(
                                tvShowId: tvShow.id,
                                isInWatchList: !isInWatchList));
                      },
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
