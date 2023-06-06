import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainSearchScreen extends StatelessWidget {
  const MainSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Main Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
