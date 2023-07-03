import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/strings_manager.dart';

@RoutePage(name: 'MainNavigationTabs')
class NavigationTabs extends StatefulWidget {
  const NavigationTabs({super.key});

  @override
  State<NavigationTabs> createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  @override
  Widget build(BuildContext context) {

    return AutoTabsScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      routes: const [
        MovieRoute(),
        TvShowRoute(),
        SearchRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return WillPopScope(
          onWillPop: () async{
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
                      tabsRouter.setActiveIndex(value);
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
