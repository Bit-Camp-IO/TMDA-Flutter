import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/presentation/screen/account_screen.dart';
import 'package:tmda/features/account/presentation/screen/account_see_all.dart';
import 'package:tmda/features/navigation/presentation/screens/navigation_tabs.dart';
import 'package:tmda/features/person/presentation/screens/person_screen.dart';
import 'package:tmda/features/auth/presentation/screens/splash_screen.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';
import 'package:tmda/features/movie/presentation/screens/see_all_movies_screen.dart';
import 'package:tmda/features/search/presentation/screens/search_screen.dart';
import 'package:tmda/features/tv/presentation/screens/see_all_tv_shows_screen.dart';
import 'package:tmda/features/tv/presentation/screens/tv_show_screen.dart';
import 'package:tmda/features/tv/presentation/screens/tv_shows_details.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
          initial: true,
          children: [
            AutoRoute(
              page: SplashRoute.page,
              path: '',
            ),
            AutoRoute(page: SelectionRoute.page, path: 'selection'),
            AutoRoute(page: LoginRoute.page, path: 'login'),
          ],
        ),
        CustomRoute(
          page: MainNavigationTabs.page,
          path: '/main',
          children: [
            CustomRoute(
              page: MovieTabRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 400,
              path: 'movie',
              children: [
                AutoRoute(
                  page: MovieRoute.page,
                  path: '',
                ),
                CustomRoute(
                  page: SeeAllMoviesRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: MovieDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
              ],
            ),
            CustomRoute(
              page: TvShowsTabRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 400,
              path: 'tv',
              children: [
                AutoRoute(
                  page: TvShowRoute.page,
                  path: '',
                ),
                CustomRoute(
                  page: TvDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: SeeAllTvShowsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
              ],
            ),
            AutoRoute(
              page: SearchTabRoute.page,
              path: 'search',
              children: [
                AutoRoute(
                  page: SearchRoute.page,
                  path: '',
                ),
                CustomRoute(
                  page: MovieDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: TvDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: SeeAllMoviesRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: SeeAllTvShowsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
              ],
            ),
            CustomRoute(
              page: AccountTabRoute.page,
              path: 'account',
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 400,
              children: [
                AutoRoute(
                  page: AccountRoute.page,
                  path: '',
                ),
                CustomRoute(
                  page: AccountSeeAllRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: MovieDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: TvDetailsRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
                ),
                CustomRoute(
                  page: PersonRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 400,
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
