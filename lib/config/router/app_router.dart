import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/features/account/presentation/screen/account_screen.dart';
import 'package:tmda/features/navigation/presentation/screens/main_navigation_bar.dart';
import 'package:tmda/features/person/presentation/screens/person_screen.dart';
import 'package:tmda/features/auth/presentation/screens/Auth_wrapper.dart';
import 'package:tmda/features/auth/presentation/screens/splash_screen.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_wrapper.dart';
import 'package:tmda/features/movie/presentation/screens/movie_wrapper.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';
import 'package:tmda/features/movie/presentation/screens/see_all_movies_screen.dart';
import 'package:tmda/features/person/presentation/screens/person_wrapper.dart';
import 'package:tmda/features/search/presentation/screens/actor_search_screen.dart';
import 'package:tmda/features/search/presentation/screens/main_search_screen.dart';
import 'package:tmda/features/search/presentation/screens/movie_search_screen.dart';
import 'package:tmda/features/search/presentation/screens/tv_search_screen.dart';
import 'package:tmda/features/tv/presentation/screens/see_all_tv_shows_screen.dart';
import 'package:tmda/features/tv/presentation/screens/tv_show_details_wrapper.dart';
import 'package:tmda/features/tv/presentation/screens/tv_shows_wrapper.dart';
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
          page: MainRoutePage.page,
          path: '/main',
          children: [
            AutoRoute(
              page: EmptyNavBarRoutePage.page,
              children: [
                CustomRoute(
                  page: MovieTabRoutePage.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 800,
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
                            CustomRoute(
                              page: MovieDetailsRoute.page,
                              path: ':movieId',
                              transitionsBuilder: TransitionsBuilders.fadeIn,
                              durationInMilliseconds: 800,
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
                CustomRoute(
                  page: TvTabRoutePage.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  durationInMilliseconds: 800,
                  path: 'tv',

                  children: [
                    AutoRoute(
                      page: TvShowsWrapperRoute.page,
                      children: [
                        AutoRoute(
                          page: TvShowRoute.page,
                          path: '',
                        ),
                        AutoRoute(
                          page: TvShowDetailsWrapperRoute.page,
                          children: [
                            CustomRoute(
                              page: TvDetailsRoute.page,
                              transitionsBuilder: TransitionsBuilders.fadeIn,
                              durationInMilliseconds: 800,
                              path: ':tvId',
                            ),
                            CustomRoute(
                              page: SeeAllTvShowsRoute.page,
                              transitionsBuilder: TransitionsBuilders.fadeIn,
                              durationInMilliseconds: 800,
                              path: ':seeAllTvShows',

                            ),
                          ],
                        )
                      ],
                    )
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
                CustomRoute(
                  page: EmptyPersonRoutePage.page,
                  path: 'person',
                  children: [
                    AutoRoute(
                      page: PersonWrapperRoute.page,
                      children: [
                        AutoRoute(
                          page: PersonRoute.page,
                          path: ':personId',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
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

@RoutePage(name: 'EmptyPersonRoutePage')
class EmptyPersonRoute extends AutoRouter {
  const EmptyPersonRoute({super.key});
}

@RoutePage(name: 'EmptyNavBarRoutePage')
class EmptyNavBarRoute extends AutoRouter {
  const EmptyNavBarRoute({super.key});
}
