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
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';
import 'package:tmda/features/account/presentation/components/see_all/see_all_movies_watchlist_component.dart';
import 'package:tmda/features/account/presentation/components/see_all/see_all_tv_shows_watchlist_component.dart';
import 'package:tmda/features/auth/presentation/widgets/no_connection.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class AccountSeeAllScreen extends StatefulWidget with AutoRouteWrapper {
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
    if (currentScroll != maxScroll &&
        scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      if (currentScroll >= maxScroll * 0.9) {
        switch (widget.watchListType) {
          case (WatchListType.moviesWatchList):
            context.read<AccountSeeAllBloc>().add(GetAllMoviesWatchListEvent());
          case (WatchListType.tvShowWatchList):
            context
                .read<AccountSeeAllBloc>()
                .add(GetAllTvShowsWatchListEvent());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 30,
            left: 20,
            child: NeonLightPainter(
              color: ColorsManager.primaryColor,
            ),
          ),
          const Positioned(
            bottom: 350,
            right: 0,
            child: NeonLightPainter(color: ColorsManager.secondaryColor),
          ),
          const Positioned(
            bottom: 10,
            left: 10,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
          ),
          BlocBuilder<AccountSeeAllBloc, AccountSeeAllState>(
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
          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                CustomIconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: Icons.arrow_back,
                ),
                SizedBox(width: 16.w),
                Text(
                  widget.watchListType.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
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
