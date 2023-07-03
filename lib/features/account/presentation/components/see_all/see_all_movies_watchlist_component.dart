import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';

class SeeAllMoviesWatchListComponent extends StatefulWidget {
  const SeeAllMoviesWatchListComponent(
      {super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SeeAllMoviesWatchListComponent> createState() =>
      _SeeAllMoviesWatchListComponentState();
}

class _SeeAllMoviesWatchListComponentState
    extends State<SeeAllMoviesWatchListComponent> with AutoRouteAware {
  late int tappedMovieId;
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
        ..add(const CheckForMoviesWatchListStatesEvent())
        ..add(GetAllMoviesWatchListEvent());
    }
  }

  @override
  void didPopNext() {
    context.read<AccountSeeAllBloc>()
      ..add(CheckForMovieStatesEvent(movieId: tappedMovieId))
      ..add(const CheckForMoviesWatchListStatesEvent())
      ..add(GetAllMoviesWatchListEvent());
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountSeeAllBloc, AccountSeeAllState>(
      listener: (context, state) {
        if (state.moviesWatchList.isEmpty) {
          context.router.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.moviesWatchList != current.moviesWatchList,
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 400.ms)],
          child: ListView.builder(
            itemCount: state.moviesWatchList.length,
            controller: widget.scrollController,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 100).r,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 14,
                  bottom: 16.0,
                ).r,
                child: Dismissible(
                  key: ObjectKey(state.moviesWatchList[index]),
                  resizeDuration: const Duration(milliseconds: 200),
                  onDismissed: (direction) => context
                      .read<AccountSeeAllBloc>()
                      .add(RemoveMovieFromWatchListEvent(
                          movieId: state.moviesWatchList[index].id)),
                  child: ListCard(
                    localErrorImagePath: AssetsManager.localErrorPoster,
                    title: state.moviesWatchList[index].title,
                    errorImagePath: AssetsManager.errorPoster,
                    posterPath: state.moviesWatchList[index].posterPath,
                    vote: state.moviesWatchList[index].voteAverage,
                    voteCount: state.moviesWatchList[index].voteCount,
                    onTap: () {
                      tappedMovieId = state.moviesWatchList[index].id;
                      context.pushRoute(MovieDetailsRoute(
                          movieId: state.moviesWatchList[index].id));
                    },
                    genres: state.moviesWatchList[index].genres,
                    releaseYear: state.moviesWatchList[index].releaseDate,
                    language: state.moviesWatchList[index].language,
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
    _tabsRouter?.removeListener(_tabListener);
    _observer!.unsubscribe(this);
  }
}
