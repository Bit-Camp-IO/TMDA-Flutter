
import 'package:flutter/material.dart';
import 'package:tmda/core/util/strings_manager.dart';

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(StringsManager.noRouteFound),
      ),
    );
  }
}