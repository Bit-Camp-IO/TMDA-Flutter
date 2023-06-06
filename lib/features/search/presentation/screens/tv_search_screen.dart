import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TvSearchScreen extends StatelessWidget {
  const TvSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Tv Search Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
