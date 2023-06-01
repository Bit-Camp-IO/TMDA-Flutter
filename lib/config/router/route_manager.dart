import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/constants/route_constants.dart';
import 'package:tmda/core/widget/no_route_found.dart';
import 'package:tmda/features/auth/presentation/screens/splash_screen.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_details_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (initialRoute):
        return MaterialPageRoute(
          builder: (context) => BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthenticationState &&
                  state.authData.requestSuccess!) {
                return const MovieScreen();
              } else if (state is AuthenticationState &&
                      !state.authData.requestSuccess! ||
                  state is AuthFailureState ||
                  state is AuthLoadingState) {
                return const LoginScreen();
              } else {
                return const SplashScreen();
              }
            },
          ),
        );

      case (loginRoute):
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case (movieRoute):
        return MaterialPageRoute(
          builder: (context) => const MovieScreen(),
        );
      case(movieDetailsRoute):
        return MaterialPageRoute(builder: (context) => MovieDetailsScreen(movieId: routeSettings.arguments.toString()));
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
