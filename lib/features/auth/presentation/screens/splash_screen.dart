import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/screens/login_screen.dart';
import 'package:tmda/features/movie/presentation/screens/movie_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthenticationState && state.authData.requestSuccess!) {
          return const MovieScreen();
        } else if (state is AuthenticationState &&
                !state.authData.requestSuccess! ||
            state is AuthFailureState ||
            state is AuthLoadingState) {
          return const LoginScreen();
        } else {
          return Scaffold(
            backgroundColor: ColorsManager.backgroundColor,
            body: Animate(
              effects: [FadeEffect(duration: 150.ms)],
              child: Center(
                child: Image.asset(AssetsManager.appLogo),
              ),
            ),
          );
        }
      },
    );
  }
}
