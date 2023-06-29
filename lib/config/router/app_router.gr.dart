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
    EmptyPersonRoutePage.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyPersonRoute(),
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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailsRouteArgs>(
          orElse: () =>
              MovieDetailsRouteArgs(movieId: pathParams.getInt('movieId')));
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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeeAllMoviesRouteArgs>(
          orElse: () => SeeAllMoviesRouteArgs(
              movieType: pathParams.get(':seeAllMovies')));
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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PersonRouteArgs>(
          orElse: () =>
              PersonRouteArgs(personId: pathParams.getInt('personId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: PersonScreen(
          key: args.key,
          personId: args.personId,
        )),
      );
    },
    ActorSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActorSearchScreen(),
      );
    },
    MainSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainSearchScreen(),
      );
    },
    MovieSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieSearchScreen(),
      );
    },
    TvSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvSearchScreen(),
      );
    },
    SeeAllTvShowsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeeAllTvShowsRouteArgs>(
          orElse: () => SeeAllTvShowsRouteArgs(
              tvShowType: pathParams.get(':seeAllTvShow')));
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
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TvDetailsRouteArgs>(
          orElse: () =>
              TvDetailsRouteArgs(tvShowId: pathParams.getInt('tvShowId')));
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
    AccountSeeAllRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AccountSeeAllRouteArgs>(
          orElse: () => AccountSeeAllRouteArgs(
              seeAllType: pathParams.get(':accountSeeAllType')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AccountSeeAllScreen(
          key: args.key,
          seeAllType: args.seeAllType,
        )),
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
/// [EmptyPersonRoute]
class EmptyPersonRoutePage extends PageRouteInfo<void> {
  const EmptyPersonRoutePage({List<PageRouteInfo>? children})
      : super(
          EmptyPersonRoutePage.name,
          initialChildren: children,
        );

  static const String name = 'EmptyPersonRoutePage';

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
          rawPathParams: {'movieId': movieId},
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
    required dynamic movieType,
    int? movieId,
    List<PageRouteInfo>? children,
  }) : super(
          SeeAllMoviesRoute.name,
          args: SeeAllMoviesRouteArgs(
            key: key,
            movieType: movieType,
            movieId: movieId,
          ),
          rawPathParams: {':seeAllMovies': movieType},
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

  final dynamic movieType;

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
    List<PageRouteInfo>? children,
  }) : super(
          PersonRoute.name,
          args: PersonRouteArgs(
            key: key,
            personId: personId,
          ),
          rawPathParams: {'personId': personId},
          initialChildren: children,
        );

  static const String name = 'PersonRoute';

  static const PageInfo<PersonRouteArgs> page = PageInfo<PersonRouteArgs>(name);
}

class PersonRouteArgs {
  const PersonRouteArgs({
    this.key,
    required this.personId,
  });

  final Key? key;

  final int personId;

  @override
  String toString() {
    return 'PersonRouteArgs{key: $key, personId: $personId}';
  }
}

/// generated route for
/// [ActorSearchScreen]
class ActorSearchRoute extends PageRouteInfo<void> {
  const ActorSearchRoute({List<PageRouteInfo>? children})
      : super(
          ActorSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActorSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainSearchScreen]
class MainSearchRoute extends PageRouteInfo<void> {
  const MainSearchRoute({List<PageRouteInfo>? children})
      : super(
          MainSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieSearchScreen]
class MovieSearchRoute extends PageRouteInfo<void> {
  const MovieSearchRoute({List<PageRouteInfo>? children})
      : super(
          MovieSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvSearchScreen]
class TvSearchRoute extends PageRouteInfo<void> {
  const TvSearchRoute({List<PageRouteInfo>? children})
      : super(
          TvSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvSearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SeeAllTvShowsScreen]
class SeeAllTvShowsRoute extends PageRouteInfo<SeeAllTvShowsRouteArgs> {
  SeeAllTvShowsRoute({
    Key? key,
    required dynamic tvShowType,
    int? tvShowId,
    List<PageRouteInfo>? children,
  }) : super(
          SeeAllTvShowsRoute.name,
          args: SeeAllTvShowsRouteArgs(
            key: key,
            tvShowType: tvShowType,
            tvShowId: tvShowId,
          ),
          rawPathParams: {':seeAllTvShow': tvShowType},
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

  final dynamic tvShowType;

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
          rawPathParams: {'tvShowId': tvShowId},
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

/// generated route for
/// [AccountSeeAllScreen]
class AccountSeeAllRoute extends PageRouteInfo<AccountSeeAllRouteArgs> {
  AccountSeeAllRoute({
    Key? key,
    required dynamic seeAllType,
    List<PageRouteInfo>? children,
  }) : super(
          AccountSeeAllRoute.name,
          args: AccountSeeAllRouteArgs(
            key: key,
            seeAllType: seeAllType,
          ),
          rawPathParams: {':accountSeeAllType': seeAllType},
          initialChildren: children,
        );

  static const String name = 'AccountSeeAllRoute';

  static const PageInfo<AccountSeeAllRouteArgs> page =
      PageInfo<AccountSeeAllRouteArgs>(name);
}

class AccountSeeAllRouteArgs {
  const AccountSeeAllRouteArgs({
    this.key,
    required this.seeAllType,
  });

  final Key? key;

  final dynamic seeAllType;

  @override
  String toString() {
    return 'AccountSeeAllRouteArgs{key: $key, seeAllType: $seeAllType}';
  }
}
