import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmda/features/account/presentation/screen/account_screen.dart';
import 'package:tmda/features/actor/presentation/screens/actor_profile_screen.dart';
import 'package:tmda/features/auth/presentation/screens/Auth_wrapper.dart';
import 'package:tmda/features/auth/presentation/screens/splash_screen.dart';
import 'package:tmda/features/main/presentation/screens/main_screen.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_wrapper.dart';
import 'package:tmda/features/movie/presentation/screens/movie_wrapper.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';
import 'package:tmda/features/movie/presentation/screens/see_all_movies_screen.dart';
import 'package:tmda/features/search/presentation/screens/actor_search_screen.dart';
import 'package:tmda/features/search/presentation/screens/main_search_screen.dart';
import 'package:tmda/features/search/presentation/screens/movie_search_screen.dart';
import 'package:tmda/features/search/presentation/screens/tv_search_screen.dart';
import 'package:tmda/features/tv/presentation/screens/see_all_tv_screen.dart';
import 'package:tmda/features/tv/presentation/screens/tv_details.dart';
import 'package:tmda/features/tv/presentation/screens/tv_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthWrapperRoute.page,
          path: '/auth',
          initial: true,
          children: [
            AutoRoute(
              page: SplashRoute.page,
              path: '',
            ),
            AutoRoute(
              page: SelectionRoute.page,
            ),
            AutoRoute(
              page: LoginRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          children: [
            AutoRoute(
              page: MovieTabRoutePage.page,
              path: 'movie',
              children: [
                AutoRoute(
                  page: MovieWrapperRoute.page,
                  children: [
                    AutoRoute(
                      page: MovieRoute.page,
                      path: '',
                    ),
                    AutoRoute(
                      page: MovieDetailsWrapperRoute.page,
                      children: [
                        AutoRoute(
                          page: MovieDetailsRoute.page,
                          path: ':movieId',
                        ),
                        CustomRoute(
                          page: SeeAllMoviesRoute.page,
                          path: ':seeAllMoviesType',
                          transitionsBuilder: TransitionsBuilders.fadeIn,
                          durationInMilliseconds: 800,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            AutoRoute(
              page: TvTabRoutePage.page,
              path: 'tv',
              children: [
                AutoRoute(
                  page: TvRoute.page,
                  path: '',
                ),
                AutoRoute(
                  page: SeeAllTvRoute.page,
                  path: 'seeAllTv',
                ),
                AutoRoute(
                  page: TvDetailsRoute.page,
                  path: ':tvId',
                ),
              ],
            ),
            AutoRoute(
              page: SearchTabRoutePage.page,
              path: 'search',
              children: [
                AutoRoute(
                  page: MainSearchRoute.page,
                  path: 'search',
                  children: [
                    AutoRoute(
                      page: MovieSearchRoute.page,
                      path: 'movieSearch',
                    ),
                    AutoRoute(
                      page: TvSearchRoute.page,
                      path: 'tvSearch',
                    ),
                    AutoRoute(
                      page: ActorSearchRoute.page,
                      path: 'movieSearch',
                    ),
                  ],
                ),
              ],
            ),
            AutoRoute(
              page: AccountTabRoutePage.page,
              path: 'account',
              children: [
                AutoRoute(
                  page: AccountRoute.page,
                  path: 'account',
                  keepHistory: false,
                ),
              ],
            ),
            AutoRoute(
              page: ActorProfileRoute.page,
              path: ':actorId',
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'MovieTabRoutePage')
class MovieTabRoute extends AutoRouter {
  const MovieTabRoute({super.key});
}

@RoutePage(name: 'TvTabRoutePage')
class TvTabRoute extends AutoRouter {
  const TvTabRoute({super.key});
}

@RoutePage(name: 'SearchTabRoutePage')
class SearchTabRoute extends AutoRouter {
  const SearchTabRoute({super.key});
}

@RoutePage(name: 'AccountTabRoutePage')
class AccountTabRoute extends AutoRouter {
  const AccountTabRoute({super.key});
}