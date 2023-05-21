import 'package:flutter/material.dart';
import 'package:tmda/core/constants/route_constants.dart';
import 'package:tmda/core/widget/no_route_found.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case (initialRoute):
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
