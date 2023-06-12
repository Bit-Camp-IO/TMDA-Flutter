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
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountScreen(),
      );
    },
    ActorProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ActorProfileRouteArgs>(
          orElse: () =>
              ActorProfileRouteArgs(actorId: pathParams.getString('actorId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActorProfileScreen(
          key: args.key,
          actorId: args.actorId,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SelectionScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailsRouteArgs>(
          orElse: () =>
              MovieDetailsRouteArgs(movieId: pathParams.getInt('movieId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieDetailsScreen(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    MovieRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieScreen(),
      );
    },
    SeeAllMoviesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeeAllMoviesRouteArgs>(
          orElse: () => SeeAllMoviesRouteArgs(
              movieType: pathParams.get(':seeAllMoviesType')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SeeAllMoviesScreen(
          key: args.key,
          movieType: args.movieType,
          movieId: args.movieId,
        ),
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
    SeeAllTvRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SeeAllTvScreen(),
      );
    },
    TvDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TvDetailsRouteArgs>(
          orElse: () => TvDetailsRouteArgs(tvId: pathParams.getString('tvId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TvDetailsScreen(
          key: args.key,
          tvId: args.tvId,
        ),
      );
    },
    TvRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TvScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    MovieWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieWrapperScreen(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthWrapperScreen(),
      );
    },
    MovieDetailsWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MovieDetailsWrapperScreen(),
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
/// [ActorProfileScreen]
class ActorProfileRoute extends PageRouteInfo<ActorProfileRouteArgs> {
  ActorProfileRoute({
    Key? key,
    required String actorId,
    List<PageRouteInfo>? children,
  }) : super(
          ActorProfileRoute.name,
          args: ActorProfileRouteArgs(
            key: key,
            actorId: actorId,
          ),
          rawPathParams: {'actorId': actorId},
          initialChildren: children,
        );

  static const String name = 'ActorProfileRoute';

  static const PageInfo<ActorProfileRouteArgs> page =
      PageInfo<ActorProfileRouteArgs>(name);
}

class ActorProfileRouteArgs {
  const ActorProfileRouteArgs({
    this.key,
    required this.actorId,
  });

  final Key? key;

  final String actorId;

  @override
  String toString() {
    return 'ActorProfileRouteArgs{key: $key, actorId: $actorId}';
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
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

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
          rawPathParams: {':seeAllMoviesType': movieType},
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
/// [SeeAllTvScreen]
class SeeAllTvRoute extends PageRouteInfo<void> {
  const SeeAllTvRoute({List<PageRouteInfo>? children})
      : super(
          SeeAllTvRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeeAllTvRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TvDetailsScreen]
class TvDetailsRoute extends PageRouteInfo<TvDetailsRouteArgs> {
  TvDetailsRoute({
    Key? key,
    required String tvId,
    List<PageRouteInfo>? children,
  }) : super(
          TvDetailsRoute.name,
          args: TvDetailsRouteArgs(
            key: key,
            tvId: tvId,
          ),
          rawPathParams: {'tvId': tvId},
          initialChildren: children,
        );

  static const String name = 'TvDetailsRoute';

  static const PageInfo<TvDetailsRouteArgs> page =
      PageInfo<TvDetailsRouteArgs>(name);
}

class TvDetailsRouteArgs {
  const TvDetailsRouteArgs({
    this.key,
    required this.tvId,
  });

  final Key? key;

  final String tvId;

  @override
  String toString() {
    return 'TvDetailsRouteArgs{key: $key, tvId: $tvId}';
  }
}

/// generated route for
/// [TvScreen]
class TvRoute extends PageRouteInfo<void> {
  const TvRoute({List<PageRouteInfo>? children})
      : super(
          TvRoute.name,
          initialChildren: children,
        );

  static const String name = 'TvRoute';

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
/// [MovieWrapperScreen]
class MovieWrapperRoute extends PageRouteInfo<void> {
  const MovieWrapperRoute({List<PageRouteInfo>? children})
      : super(
          MovieWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthWrapperScreen]
class AuthWrapperRoute extends PageRouteInfo<void> {
  const AuthWrapperRoute({List<PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MovieDetailsWrapperScreen]
class MovieDetailsWrapperRoute extends PageRouteInfo<void> {
  const MovieDetailsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          MovieDetailsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MovieDetailsWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
