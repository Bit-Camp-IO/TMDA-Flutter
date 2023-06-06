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
    EmptyMovieRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyMovieRoutePage(),
      );
    },
    EmptyTvRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyTvRoutePage(),
      );
    },
    EmptySearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptySearchRoutePage(),
      );
    },
    EmptyAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyHomeRoutePage(),
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
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
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
    MovieDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailsRouteArgs>(
          orElse: () =>
              MovieDetailsRouteArgs(movieId: pathParams.getString('movieId')));
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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SeeAllMoviesScreen(),
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
  };
}

/// generated route for
/// [EmptyMovieRoutePage]
class EmptyMovieRoute extends PageRouteInfo<void> {
  const EmptyMovieRoute({List<PageRouteInfo>? children})
      : super(
          EmptyMovieRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyMovieRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyTvRoutePage]
class EmptyTvRoute extends PageRouteInfo<void> {
  const EmptyTvRoute({List<PageRouteInfo>? children})
      : super(
          EmptyTvRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyTvRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptySearchRoutePage]
class EmptySearchRoute extends PageRouteInfo<void> {
  const EmptySearchRoute({List<PageRouteInfo>? children})
      : super(
          EmptySearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptySearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmptyHomeRoutePage]
class EmptyAccountRoute extends PageRouteInfo<void> {
  const EmptyAccountRoute({List<PageRouteInfo>? children})
      : super(
          EmptyAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyAccountRoute';

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
/// [MovieDetailsScreen]
class MovieDetailsRoute extends PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    Key? key,
    required String movieId,
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

  final String movieId;

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
class SeeAllMoviesRoute extends PageRouteInfo<void> {
  const SeeAllMoviesRoute({List<PageRouteInfo>? children})
      : super(
          SeeAllMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeeAllMoviesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
