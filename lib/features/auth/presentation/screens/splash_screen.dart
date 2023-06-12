import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is AuthenticatedState) {
          AutoRouter.of(context).replace(
            const MainRoute(),
          );
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is UnAuthenticatedState) {
          return const SelectionScreen();
        } else {
          return Scaffold(
            body: Center(
              child: SvgPicture.asset(AssetsManager.appLogo),
            ),
          );
        }
      },
    );
  }
}
