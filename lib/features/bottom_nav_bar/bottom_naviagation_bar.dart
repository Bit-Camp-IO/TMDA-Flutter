import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/features/account/presentation/bloc/account_cubit/account_bloc.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage(name: 'BottomNaviagationBarRoute')
class BottomNaviagationBar extends StatefulWidget implements AutoRouteWrapper {
  const BottomNaviagationBar({super.key});

  @override
  State<BottomNaviagationBar> createState() => _BottomNaviagationBarState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AccountCubit>()..getAccountDetails(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => getIt<WatchListBloc>()
            ..add(GetMoviesWatchListIdsEvent())
            ..add(GetTvShowsWatchListIdsEvent())
            ..add(GetMoviesWatchListEvent())
            ..add(GetTvShowsWatchListEvent()),
          lazy: false,
        ),
      ],
      child: this,
    );
  }
}

class _BottomNaviagationBarState extends State<BottomNaviagationBar> {
  DateTime? _lastTapTime;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      lazyLoad: false,
      routes: const [
        MovieRoute(),
        TvShowRoute(),
        SearchRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return WillPopScope(
          onWillPop: () async {
            if (tabsRouter.activeIndex == 0) {
              return Future.value(true);
            } else {
              tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
              return Future.value(false);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0).w,
                topRight: const Radius.circular(15.0).w,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0).w,
                topRight: const Radius.circular(15.0).w,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 50,
                  sigmaY: 50,
                ),
                child: BottomNavigationBar(
                  currentIndex: tabsRouter.activeIndex,
                  onTap: (value) {
                    final timeNow = DateTime.now();
                    if (_lastTapTime != null &&
                        timeNow.difference(_lastTapTime!) <=
                            const Duration(milliseconds: 300)) {
                      switch (tabsRouter.activeIndex) {
                        case 0:
                          context.router.root.navigate(const MovieRoute());
                        case 1:
                          context.router.root.navigate(const TvShowRoute());
                        case 2:
                          context.router.root.navigate(const SearchRoute());
                        case 3:
                          context.router.root.navigate(const AccountRoute());
                      }
                    } else {
                      tabsRouter.setActiveIndex(value);
                    }
                    _lastTapTime = timeNow;
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(SolarSystemIcons.movie),
                      label: StringsManager.movie,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(SolarSystemIcons.tv),
                      label: StringsManager.tv,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(SolarSystemIcons.search),
                      label: StringsManager.search,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(SolarSystemIcons.person),
                      label: StringsManager.account,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
