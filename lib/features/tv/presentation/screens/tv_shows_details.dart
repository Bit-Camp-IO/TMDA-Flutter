import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmda/core/widget/custom_icon_button.dart';

@RoutePage()
class TvDetailsScreen extends StatelessWidget {
  const TvDetailsScreen({super.key, @PathParam('tvId') required this.tvId});
  final String tvId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Tv Details',
              
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: CustomIconButton(
                onPressed: () {
                  context.popRoute();
                },
                icon: Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
