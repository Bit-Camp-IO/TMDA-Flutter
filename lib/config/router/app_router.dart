import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/presentation/screen/account_screen.dart';
import 'package:tmda/features/account/presentation/screen/account_see_all.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';
import 'package:tmda/features/auth/presentation/screens/splash_screen.dart';
import 'package:tmda/features/bottom_nav_bar/bottom_naviagation_bar.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';
import 'package:tmda/features/movie/presentation/screens/see_all_movies_screen.dart';
import 'package:tmda/features/person/presentation/screens/person_screen.dart';
import 'package:tmda/features/search/presentation/screens/search_screen.dart';
import 'package:tmda/features/tv/presentation/screens/see_all_tv_shows_screen.dart';
import 'package:tmda/features/tv/presentation/screens/tv_show_screen.dart';
import 'package:tmda/features/tv/presentation/screens/tv_shows_details.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: SplashRoute.page,
              path: '',
            ),
            CustomRoute(
              page: SelectionRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              duration: Duration(milliseconds: 400),
            ),
            CustomRoute(
              page: LoginRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              duration: Duration(milliseconds: 400),
            ),
          ],
        ),
        CustomRoute(
          page: BottomNaviagationBarRoute.page,
          children: [
            CustomRoute(
              page: MovieTabRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              duration: Duration(milliseconds: 400),
              initial: true,
              children: [
                CustomRoute(
                  page: MovieRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: SeeAllMoviesRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: MovieDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
              ],
            ),
            CustomRoute(
              page: TvShowsTabRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              duration: Duration(milliseconds: 400),
              children: [
                CustomRoute(
                  page: TvShowRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: TvDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: SeeAllTvShowsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
              ],
            ),
            CustomRoute(
              page: SearchTabRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              duration: Duration(milliseconds: 400),
              children: [
                CustomRoute(
                  page: SearchRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: MovieDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: TvDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: SeeAllMoviesRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: SeeAllTvShowsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
              ],
            ),
            CustomRoute(
              page: AccountTabRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              duration: Duration(milliseconds: 400),
              children: [
                CustomRoute(
                  page: AccountRoute.page,
                  initial: true,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: AccountSeeAllRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: MovieDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: TvDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  duration: Duration(milliseconds: 400),
                ),
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'MovieTabRoute')
class MoviesTab extends AutoRouter {
  const MoviesTab({super.key});
}

@RoutePage(name: 'TvShowsTabRoute')
class TvShowsTab extends AutoRouter {
  const TvShowsTab({super.key});
}

@RoutePage(name: 'SearchTabRoute')
class SearchTab extends AutoRouter {
  const SearchTab({super.key});
}

@RoutePage(name: 'AccountTabRoute')
class AccountTab extends AutoRouter {
  const AccountTab({super.key});
}

@RoutePage(name: 'AuthRoute')
class Auth extends AutoRouter {
  const Auth({super.key});
}
