import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';

class SeeAllTvShowsWatchListComponent extends StatefulWidget {
  const SeeAllTvShowsWatchListComponent(
      {super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SeeAllTvShowsWatchListComponent> createState() =>
      _SeeAllTvShowsWatchListComponentState();
}

class _SeeAllTvShowsWatchListComponentState
    extends State<SeeAllTvShowsWatchListComponent> with AutoRouteAware {
  late int tappedTvShowId;
  AutoRouteObserver? _observer;
  TabsRouter? _tabsRouter;

  @override
  void didChangeDependencies() {
    _observer =
        RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer!.subscribe(this, context.routeData);
    }
    _tabsRouter = context.tabsRouter;
    _tabsRouter?.addListener(_tabListener);
    super.didChangeDependencies();
  }

  void _tabListener() {
    if (context.tabsRouter.activeIndex == 3) {
      context.read<AccountSeeAllBloc>()
        ..add(const CheckForTvShowsWatchListStatesEvent())
        ..add(GetAllTvShowsWatchListEvent());
    }
  }

  @override
  void didPopNext() {
    context.read<AccountSeeAllBloc>()
      ..add(CheckForTvShowStatesEvent(tvShowId: tappedTvShowId))
      ..add(const CheckForTvShowsWatchListStatesEvent())
      ..add(GetAllTvShowsWatchListEvent());
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountSeeAllBloc, AccountSeeAllState>(
      listener: (context, state) {
        if (state.tvShowsWatchList.isEmpty) {
          context.router.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.tvShowsWatchList != current.tvShowsWatchList,
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 400.ms)],
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
                  onDismissed: (direction) => context
                      .read<AccountSeeAllBloc>()
                      .add(
                    RemoveTvShowFromWatchListEvent(
                          tvShowId: tvShow.id,
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
                      tappedTvShowId = tvShow.id;
                      context.pushRoute(TvDetailsRoute(
                          tvShowId: tvShow.id
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
    _observer!.unsubscribe(this);
    _tabsRouter?.removeListener(_tabListener);
  }
}
