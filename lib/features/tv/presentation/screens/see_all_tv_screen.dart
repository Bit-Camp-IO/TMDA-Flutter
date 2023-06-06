import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/widget/custom_icon_button.dart';

@RoutePage()
class SeeAllTvScreen extends StatelessWidget {
  const SeeAllTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: CustomIconButton(
              onPressed: () {
                context.popRoute();
              },
              icon: Icons.arrow_back,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Tv Details',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.pushRoute(TvDetailsRoute(tvId: 'tvId'));
                  },
                  child: const Text('See All Tv Screen'))
            ],
          ),
        ],
      ),
    );
  }
}
