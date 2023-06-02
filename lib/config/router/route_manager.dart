import 'package:flutter/material.dart';
import 'package:tmda/core/widget/no_route_found.dart';
import 'package:tmda/features/auth/presentation/screens/splash_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String movieRoute = '/movie';
  static const String movieDetailsRoute = '/movieDetails';
}

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (AppRouter.initialRoute):
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case (AppRouter.movieRoute):
        return MaterialPageRoute(
          builder: (context) => const MovieScreen(),
        );
      case (AppRouter.movieDetailsRoute):
        return MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(
            movieId: routeSettings.arguments.toString(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
