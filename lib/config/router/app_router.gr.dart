// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AccountScreen]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(AccountRoute.name, initialChildren: children);

  static const String name = 'AccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountScreen();
    },
  );
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
          args: AccountSeeAllRouteArgs(key: key, watchListType: watchListType),
          initialChildren: children,
        );

  static const String name = 'AccountSeeAllRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AccountSeeAllRouteArgs>();
      return AccountSeeAllScreen(
        key: args.key,
        watchListType: args.watchListType,
      );
    },
  );
}

class AccountSeeAllRouteArgs {
  const AccountSeeAllRouteArgs({this.key, required this.watchListType});

  final Key? key;

  final WatchListType watchListType;

  @override
  String toString() {
    return 'AccountSeeAllRouteArgs{key: $key, watchListType: $watchListType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AccountSeeAllRouteArgs) return false;
    return key == other.key && watchListType == other.watchListType;
  }

  @override
  int get hashCode => key.hashCode ^ watchListType.hashCode;
}

/// generated route for
/// [AccountTab]
class AccountTabRoute extends PageRouteInfo<void> {
  const AccountTabRoute({List<PageRouteInfo>? children})
      : super(AccountTabRoute.name, initialChildren: children);

  static const String name = 'AccountTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AccountTab();
    },
  );
}

/// generated route for
/// [Auth]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Auth();
    },
  );
}

/// generated route for
/// [BottomNaviagationBar]
class BottomNaviagationBarRoute extends PageRouteInfo<void> {
  const BottomNaviagationBarRoute({List<PageRouteInfo>? children})
      : super(BottomNaviagationBarRoute.name, initialChildren: children);

  static const String name = 'BottomNaviagationBarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const BottomNaviagationBar());
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginScreen());
    },
  );
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
          args: MovieDetailsRouteArgs(key: key, movieId: movieId),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return WrappedRoute(
        child: MovieDetailsScreen(key: args.key, movieId: args.movieId),
      );
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MovieDetailsRouteArgs) return false;
    return key == other.key && movieId == other.movieId;
  }

  @override
  int get hashCode => key.hashCode ^ movieId.hashCode;
}

/// generated route for
/// [MovieScreen]
class MovieRoute extends PageRouteInfo<void> {
  const MovieRoute({List<PageRouteInfo>? children})
      : super(MovieRoute.name, initialChildren: children);

  static const String name = 'MovieRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MovieScreen());
    },
  );
}

/// generated route for
/// [MoviesTab]
class MovieTabRoute extends PageRouteInfo<void> {
  const MovieTabRoute({List<PageRouteInfo>? children})
      : super(MovieTabRoute.name, initialChildren: children);

  static const String name = 'MovieTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MoviesTab();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PersonRouteArgs>();
      return WrappedRoute(
        child: PersonScreen(
          key: args.key,
          personId: args.personId,
          personScreenType: args.personScreenType,
        ),
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PersonRouteArgs) return false;
    return key == other.key &&
        personId == other.personId &&
        personScreenType == other.personScreenType;
  }

  @override
  int get hashCode =>
      key.hashCode ^ personId.hashCode ^ personScreenType.hashCode;
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SearchScreen());
    },
  );
}

/// generated route for
/// [SearchTab]
class SearchTabRoute extends PageRouteInfo<void> {
  const SearchTabRoute({List<PageRouteInfo>? children})
      : super(SearchTabRoute.name, initialChildren: children);

  static const String name = 'SearchTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchTab();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeAllMoviesRouteArgs>();
      return WrappedRoute(
        child: SeeAllMoviesScreen(
          key: args.key,
          movieType: args.movieType,
          movieId: args.movieId,
        ),
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeeAllMoviesRouteArgs) return false;
    return key == other.key &&
        movieType == other.movieType &&
        movieId == other.movieId;
  }

  @override
  int get hashCode => key.hashCode ^ movieType.hashCode ^ movieId.hashCode;
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeeAllTvShowsRouteArgs>();
      return WrappedRoute(
        child: SeeAllTvShowsScreen(
          key: args.key,
          tvShowType: args.tvShowType,
          tvShowId: args.tvShowId,
        ),
      );
    },
  );
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeeAllTvShowsRouteArgs) return false;
    return key == other.key &&
        tvShowType == other.tvShowType &&
        tvShowId == other.tvShowId;
  }

  @override
  int get hashCode => key.hashCode ^ tvShowType.hashCode ^ tvShowId.hashCode;
}

/// generated route for
/// [SelectionScreen]
class SelectionRoute extends PageRouteInfo<void> {
  const SelectionRoute({List<PageRouteInfo>? children})
      : super(SelectionRoute.name, initialChildren: children);

  static const String name = 'SelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SelectionScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SplashScreen());
    },
  );
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
          args: TvDetailsRouteArgs(key: key, tvShowId: tvShowId),
          initialChildren: children,
        );

  static const String name = 'TvDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TvDetailsRouteArgs>();
      return WrappedRoute(
        child: TvDetailsScreen(key: args.key, tvShowId: args.tvShowId),
      );
    },
  );
}

class TvDetailsRouteArgs {
  const TvDetailsRouteArgs({this.key, required this.tvShowId});

  final Key? key;

  final int tvShowId;

  @override
  String toString() {
    return 'TvDetailsRouteArgs{key: $key, tvShowId: $tvShowId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TvDetailsRouteArgs) return false;
    return key == other.key && tvShowId == other.tvShowId;
  }

  @override
  int get hashCode => key.hashCode ^ tvShowId.hashCode;
}

/// generated route for
/// [TvShowScreen]
class TvShowRoute extends PageRouteInfo<void> {
  const TvShowRoute({List<PageRouteInfo>? children})
      : super(TvShowRoute.name, initialChildren: children);

  static const String name = 'TvShowRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const TvShowScreen());
    },
  );
}

/// generated route for
/// [TvShowsTab]
class TvShowsTabRoute extends PageRouteInfo<void> {
  const TvShowsTabRoute({List<PageRouteInfo>? children})
      : super(TvShowsTabRoute.name, initialChildren: children);

  static const String name = 'TvShowsTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TvShowsTab();
    },
  );
}
