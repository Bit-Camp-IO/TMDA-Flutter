import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart';
import 'package:tmda/features/account/presentation/components/account/movies_watchlist_component.dart';
import 'package:tmda/features/account/presentation/components/account/profile_component.dart';
import 'package:tmda/features/account/presentation/components/account/tv_show_watchlist_component.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class AccountScreen extends StatefulWidget with AutoRouteWrapper {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountBloc>()
        ..add(GetAccountDetailsEvent())
        ..add(GetAccountMoviesWatchListEvent())
        ..add(GetAccountTvShowsWatchListEvent()),
      child: this,
    );
  }
}

class _AccountScreenState extends State<AccountScreen> with AutoRouteAwareStateMixin<AccountScreen>{
  TabsRouter? _tabsRouter;

  @override
  void didChangeDependencies() {
    _tabsRouter = context.tabsRouter;
    _tabsRouter?.addListener(_tabListener);
    super.didChangeDependencies();
  }

  void _tabListener(){
    if (context.tabsRouter.activeIndex == 3) {
      context.read<AccountBloc>()
        ..add(GetAccountMoviesWatchListEvent())
        ..add(GetAccountTvShowsWatchListEvent());
    }
  }

  @override
  void didPopNext() {
    context.read<AccountBloc>()
      ..add(GetAccountMoviesWatchListEvent())
      ..add(GetAccountTvShowsWatchListEvent());
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
          BlocConsumer<AccountBloc, AccountState>(
            listener: (context, state) {
              if (state.userAccountState == UserAccountState.loggedOut) {
                AutoRouter.of(context).replace(
                  const AuthRoutesPage(
                    children: [
                      SelectionRoute(),
                    ]
                  )
                );
              }
            },
            builder: (context, state) {
              switch (state.accountTabState) {
                case BlocState.initial || BlocState.loading:
                  return Center(
                    child: Lottie.asset(AssetsManager.neonLoading),
                  );
                case BlocState.success:
                  return ListView(
                    children: [
                      SizedBox(height: 40.h),
                      const ProfileComponent(),
                      SizedBox(height: 10.h),
                      const MoviesWatchListComponent(),
                      const TvShowWatchListComponent(),
                    ],
                  );
                case BlocState.failure:
                  return NoConnection(
                    onTap: () {
                      context.read<AccountBloc>()
                        ..add(GetAccountDetailsEvent())
                        ..add(GetAccountMoviesWatchListEvent())
                        ..add(GetAccountTvShowsWatchListEvent());
                    },
                  );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabsRouter?.removeListener(_tabListener);
  }
}
