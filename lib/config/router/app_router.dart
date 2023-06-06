import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmda/features/account/presentation/screen/account_screen.dart';
import 'package:tmda/features/actor/presentation/screens/actor_profile_screen.dart';
import 'package:tmda/features/app/presentation/screens/app_main_screen.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
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
          path: '/',
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: EmptyMovieRoute.page,
              path: 'movie',
              children: [
                AutoRoute(
                  page: MovieRoute.page,
                  path: '',
                ),
                AutoRoute(
                  page: SeeAllMoviesRoute.page,
                  path: 'seeAllMovies',
                ),
                AutoRoute(
                  page: MovieDetailsRoute.page,
                  path: ':movieId',
                ),
              ],
            ),
            AutoRoute(
              page: EmptyTvRoute.page,
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
              page: EmptySearchRoute.page,
              path: 'search',
              children: [
                AutoRoute(
                  page: MainSearchRoute.page,
                  path: '',
                ),
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
            AutoRoute(
              page: ActorProfileRoute.page,
              path: ':actorId',
            ),
            AutoRoute(
              page: AccountRoute.page,
              path: 'account',
            ),
          ],
        ),

        AutoRoute(
          page: SelectionRoute.page,
          path: '/selection',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
      ];
}

@RoutePage(name: 'EmptyMovieRoute')
class EmptyMovieRoutePage extends AutoRouter {
  const EmptyMovieRoutePage({super.key});
}

@RoutePage(name: 'EmptyTvRoute')
class EmptyTvRoutePage extends AutoRouter {
  const EmptyTvRoutePage({super.key});
}

@RoutePage(name: 'EmptySearchRoute')
class EmptySearchRoutePage extends AutoRouter {
  const EmptySearchRoutePage({super.key});
}

@RoutePage(name: 'EmptyAccountRoute')
class EmptyHomeRoutePage extends AutoRouter {
  const EmptyHomeRoutePage({super.key});
}