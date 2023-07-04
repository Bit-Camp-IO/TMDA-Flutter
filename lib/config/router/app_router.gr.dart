// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MovieTabRoutePage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieTabRoute(),
      );
    },
    TvTabRoutePage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvTabRoute(),
      );
    },
    SearchTabRoutePage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchTabRoute(),
      );
    },
    AccountTabRoutePage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountTabRoute(),
      );
    },
    AuthRoutesPage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthRoutes(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountScreen()),
      );
    },
    AccountSeeAllRoute.name: (routeData) {
      final args = routeData.argsAs<AccountSeeAllRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AccountSeeAllScreen(
          key: args.key,
          watchListType: args.watchListType,
        )),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginScreen()),
      );
    },
    SelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectionScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SplashScreen()),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: MovieDetailsScreen(
          key: args.key,
          movieId: args.movieId,
        )),
      );
    },
    MovieRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MovieScreen()),
      );
    },
    SeeAllMoviesRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllMoviesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SeeAllMoviesScreen(
          key: args.key,
          movieType: args.movieType,
          movieId: args.movieId,
        )),
      );
    },
    MainNavigationTabs.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigationTabs(),
      );
    },
    PersonRoute.name: (routeData) {
      final args = routeData.argsAs<PersonRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PersonScreen(
          key: args.key,
          personId: args.personId,
          personScreenType: args.personScreenType,
        )),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SearchScreen()),
      );
    },
    SeeAllTvShowsRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllTvShowsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: SeeAllTvShowsScreen(
          key: args.key,
          tvShowType: args.tvShowType,
          tvShowId: args.tvShowId,
        )),
      );
    },
    TvDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TvDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: TvDetailsScreen(
          key: args.key,
          tvShowId: args.tvShowId,
        )),
      );
    },
    TvShowRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TvShowScreen()),
      );
    },
  };
}

/// generated route for
/// [MovieTabRoute]
class MovieTabRoutePage extends PageRouteInfo<void> {
  const MovieTabRoutePage({List<PageRouteInfo>? children})
      : super(
          MovieTabRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'MovieTabRoutePage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvTabRoute]
class TvTabRoutePage extends PageRouteInfo<void> {
  const TvTabRoutePage({List<PageRouteInfo>? children})
      : super(
          TvTabRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'TvTabRoutePage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchTabRoute]
class SearchTabRoutePage extends PageRouteInfo<void> {
  const SearchTabRoutePage({List<PageRouteInfo>? children})
      : super(
          SearchTabRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'SearchTabRoutePage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountTabRoute]
class AccountTabRoutePage extends PageRouteInfo<void> {
  const AccountTabRoutePage({List<PageRouteInfo>? children})
      : super(
          AccountTabRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'AccountTabRoutePage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthRoutes]
class AuthRoutesPage extends PageRouteInfo<void> {
  const AuthRoutesPage({List<PageRouteInfo>? children})
      : super(
          AuthRoutesPage.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoutesPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountSeeAllScreen]
class AccountSeeAllRoute extends PageRouteInfo<AccountSeeAllRouteArgs> {
  AccountSeeAllRoute({
    Key? key,
    required WatchListType watchListType,
    List<PageRouteInfo>? children,
  }) : super(
          AccountSeeAllRoute.name,
          args: AccountSeeAllRouteArgs(
            key: key,
            watchListType: watchListType,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountSeeAllRoute';

  static const PageInfo<AccountSeeAllRouteArgs> page =
      PageInfo<AccountSeeAllRouteArgs>(name);
}

class AccountSeeAllRouteArgs {
  const AccountSeeAllRouteArgs({
    this.key,
    required this.watchListType,
  });

  final Key? key;

  final WatchListType watchListType;

  @override
  String toString() {
    return 'AccountSeeAllRouteArgs{key: $key, watchListType: $watchListType}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectionScreen]
class SelectionRoute extends PageRouteInfo<void> {
  const SelectionRoute({List<PageRouteInfo>? children})
      : super(
          SelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required int movieId,
    List<PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const PageInfo<MovieDetailsRouteArgs> page =
      PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movieId,
  });

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [MovieScreen]
class MovieRoute extends PageRouteInfo<void> {
  const MovieRoute({List<PageRouteInfo>? children})
      : super(
          MovieRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SeeAllMoviesScreen]
class SeeAllMoviesRoute extends PageRouteInfo<SeeAllMoviesRouteArgs> {
  SeeAllMoviesRoute({
    Key? key,
    required MovieType movieType,
    int? movieId,
    List<PageRouteInfo>? children,
  }) : super(
          SeeAllMoviesRoute.name,
          args: SeeAllMoviesRouteArgs(
            key: key,
            movieType: movieType,
            movieId: movieId,
          ),
          initialChildren: children,
        );

  static const String name = 'SeeAllMoviesRoute';

  static const PageInfo<SeeAllMoviesRouteArgs> page =
      PageInfo<SeeAllMoviesRouteArgs>(name);
}

class SeeAllMoviesRouteArgs {
  const SeeAllMoviesRouteArgs({
    this.key,
    required this.movieType,
    this.movieId,
  });

  final Key? key;

  final MovieType movieType;

  final int? movieId;

  @override
  String toString() {
    return 'SeeAllMoviesRouteArgs{key: $key, movieType: $movieType, movieId: $movieId}';
  }
}

/// generated route for
/// [NavigationTabs]
class MainNavigationTabs extends PageRouteInfo<void> {
  const MainNavigationTabs({List<PageRouteInfo>? children})
      : super(
          MainNavigationTabs.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigationTabs';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonScreen]
class PersonRoute extends PageRouteInfo<PersonRouteArgs> {
  PersonRoute({
    Key? key,
    required int personId,
    required PersonScreenType personScreenType,
    List<PageRouteInfo>? children,
  }) : super(
          PersonRoute.name,
          args: PersonRouteArgs(
            key: key,
            personId: personId,
            personScreenType: personScreenType,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonRoute';

  static const PageInfo<PersonRouteArgs> page = PageInfo<PersonRouteArgs>(name);
}

class PersonRouteArgs {
  const PersonRouteArgs({
    this.key,
    required this.personId,
    required this.personScreenType,
  });

  final Key? key;

  final int personId;

  final PersonScreenType personScreenType;

  @override
  String toString() {
    return 'PersonRouteArgs{key: $key, personId: $personId, personScreenType: $personScreenType}';
  }
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SeeAllTvShowsScreen]
class SeeAllTvShowsRoute extends PageRouteInfo<SeeAllTvShowsRouteArgs> {
  SeeAllTvShowsRoute({
    Key? key,
    required TvShowType tvShowType,
    int? tvShowId,
    List<PageRouteInfo>? children,
  }) : super(
          SeeAllTvShowsRoute.name,
          args: SeeAllTvShowsRouteArgs(
            key: key,
            tvShowType: tvShowType,
            tvShowId: tvShowId,
          ),
          initialChildren: children,
        );

  static const String name = 'SeeAllTvShowsRoute';

  static const PageInfo<SeeAllTvShowsRouteArgs> page =
      PageInfo<SeeAllTvShowsRouteArgs>(name);
}

class SeeAllTvShowsRouteArgs {
  const SeeAllTvShowsRouteArgs({
    this.key,
    required this.tvShowType,
    this.tvShowId,
  });

  final Key? key;

  final TvShowType tvShowType;

  final int? tvShowId;

  @override
  String toString() {
    return 'SeeAllTvShowsRouteArgs{key: $key, tvShowType: $tvShowType, tvShowId: $tvShowId}';
  }
}

/// generated route for
/// [TvDetailsScreen]
class TvDetailsRoute extends PageRouteInfo<TvDetailsRouteArgs> {
  TvDetailsRoute({
    Key? key,
    required int tvShowId,
    List<PageRouteInfo>? children,
  }) : super(
          TvDetailsRoute.name,
          args: TvDetailsRouteArgs(
            key: key,
            tvShowId: tvShowId,
          ),
          initialChildren: children,
        );

  static const String name = 'TvDetailsRoute';

  static const PageInfo<TvDetailsRouteArgs> page =
      PageInfo<TvDetailsRouteArgs>(name);
}

class TvDetailsRouteArgs {
  const TvDetailsRouteArgs({
    this.key,
    required this.tvShowId,
  });

  final Key? key;

  final int tvShowId;

  @override
  String toString() {
    return 'TvDetailsRouteArgs{key: $key, tvShowId: $tvShowId}';
  }
}

/// generated route for
/// [TvShowScreen]
class TvShowRoute extends PageRouteInfo<void> {
  const TvShowRoute({List<PageRouteInfo>? children})
      : super(
          TvShowRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvShowRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
