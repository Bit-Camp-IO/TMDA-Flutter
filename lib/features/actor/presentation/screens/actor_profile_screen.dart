import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActorProfileScreen extends StatelessWidget {
  const ActorProfileScreen(
      {super.key, @PathParam('actorId') required this.actorId});

  final String actorId;
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
