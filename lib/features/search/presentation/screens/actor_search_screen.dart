import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActorSearchScreen extends StatelessWidget {
  const ActorSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Actor Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
