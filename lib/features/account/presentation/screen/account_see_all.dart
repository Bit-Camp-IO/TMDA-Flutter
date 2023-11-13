import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/features/account/presentation/components/see_all/see_all_movies_watchlist_component.dart';
import 'package:tmda/features/account/presentation/components/see_all/see_all_tv_shows_watchlist_component.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

@RoutePage()
class AccountSeeAllScreen extends StatefulWidget {
  const AccountSeeAllScreen({super.key, required this.watchListType});

  final WatchListType watchListType;

  @override
  State<AccountSeeAllScreen> createState() => _AccountSeeAllScreenState();
}

class _AccountSeeAllScreenState extends State<AccountSeeAllScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final double maxScroll = scrollController.position.maxScrollExtent;
    final double currentScroll = scrollController.offset;
    final ScrollDirection scrollDirection = scrollController.position.userScrollDirection;
    final WatchListBloc watchListBloc = context.read<WatchListBloc>();
    if (currentScroll != maxScroll && scrollDirection == ScrollDirection.reverse) {
      if (currentScroll >= maxScroll * 0.9) {
        switch (widget.watchListType) {
          case (WatchListType.moviesWatchList):
            watchListBloc.add(GetMoviesWatchListEvent());
          case (WatchListType.tvShowWatchList):
            watchListBloc.add(GetTvShowsWatchListEvent());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonLightBackGround(
        isBackButtonActive: true,
        backButtonTitle: widget.watchListType.name,
        child: Builder(
          builder: (context) {
            switch (widget.watchListType) {
              case (WatchListType.moviesWatchList):
                return SeeAllMoviesWatchListComponent(
                  scrollController: scrollController,
                );
              case (WatchListType.tvShowWatchList):
                return SeeAllTvShowsWatchListComponent(
                  scrollController: scrollController,
                );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController..removeListener(_onScroll)..dispose();
    super.dispose();
  }
}
