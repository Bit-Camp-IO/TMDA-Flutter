import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tmda/core/util/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19191B),
      body: Animate(
        effects: [FadeEffect(duration: 150.ms)],
        child: Center(
          child: Image.asset(AssetsManager.appLogo),
        ),
      ),
    );
  }
}
