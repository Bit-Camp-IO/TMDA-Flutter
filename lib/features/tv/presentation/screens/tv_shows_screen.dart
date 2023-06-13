import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmda/config/router/app_router.dart';

@RoutePage()
class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Tv Screen',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.pushRoute(const SeeAllTvRoute());
              },
              child: const Text('See All Tv Screen'))
        ],
      ),
    );
  }
}
