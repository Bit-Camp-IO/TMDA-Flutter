// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';
import 'package:tmda/features/account/presentation/components/see_all/see_all_movies_watchlist_component.dart';
import 'package:tmda/features/account/presentation/components/see_all/see_all_tv_shows_watchlist_component.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class AccountSeeAllScreen extends StatefulWidget implements AutoRouteWrapper {
  const AccountSeeAllScreen({super.key, required this.watchListType});

  final WatchListType watchListType;

  @override
  State<AccountSeeAllScreen> createState() => _AccountSeeAllScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountSeeAllBloc>(),
      child: this,
    );
  }
}

class _AccountSeeAllScreenState extends State<AccountSeeAllScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    switch (widget.watchListType) {
      case (WatchListType.moviesWatchList):
        context.read<AccountSeeAllBloc>().add(GetAllMoviesWatchListEvent());
      case (WatchListType.tvShowWatchList):
        context.read<AccountSeeAllBloc>().add(GetAllTvShowsWatchListEvent());
    }
    super.initState();
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    final scrollDirection = scrollController.position.userScrollDirection;
    final accountBloc = context.read<AccountSeeAllBloc>();
    if (currentScroll != maxScroll && scrollDirection == ScrollDirection.reverse) {
      if (currentScroll >= maxScroll * 0.9) {
        switch (widget.watchListType) {
          case (WatchListType.moviesWatchList):
            accountBloc.add(GetAllMoviesWatchListEvent());
          case (WatchListType.tvShowWatchList):
            accountBloc.add(GetAllTvShowsWatchListEvent());
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
        child: BlocBuilder<AccountSeeAllBloc, AccountSeeAllState>(
          builder: (context, state) {
            switch (state.seeAllState) {
              case BlocState.initial || BlocState.loading:
                return Center(
                  child: Lottie.asset(AssetsManager.neonLoading),
                );
              case BlocState.success:
                return Builder(
                  builder: (context) {
                    switch (widget.watchListType) {
                      case (WatchListType.moviesWatchList):
                        return SeeAllMoviesWatchListComponent(
                            scrollController: scrollController);
                      case (WatchListType.tvShowWatchList):
                        return SeeAllTvShowsWatchListComponent(
                            scrollController: scrollController);
                    }
                  },
                );
              case BlocState.failure:
                return NoConnection(
                  onTap: () {
                    switch (widget.watchListType) {
                      case (WatchListType.moviesWatchList):
                        context.read<AccountSeeAllBloc>().add(
                            GetAllMoviesWatchListEvent());
                      case (WatchListType.tvShowWatchList):
                        context.read<AccountSeeAllBloc>().add(
                            GetAllTvShowsWatchListEvent());
                    }
                  },
                );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
