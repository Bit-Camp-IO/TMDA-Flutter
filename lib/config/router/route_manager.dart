import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/constants/route_constants.dart';
import 'package:tmda/core/widget/no_route_found.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (initialRoute):
        return MaterialPageRoute(
          builder: (context) => BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial && state.authData.requestSuccess!) {
                return MovieScreen(sessionId: state.authData.sessionId!);
              } else {
                return const LoginScreen();
              }
            },
          ),
        );
      case (movieRoute):
        return MaterialPageRoute(
          builder: (context) =>
              MovieScreen(sessionId: routeSettings.arguments.toString()),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
