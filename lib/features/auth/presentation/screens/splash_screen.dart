import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/auth/presentation/screens/selection_screen.dart';
import 'package:tmda/features/shared/presentation/blocs/auth_cubit/token_cubit.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SplashScreen extends StatelessWidget implements AutoRouteWrapper{
  const SplashScreen({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TokenCubit>()..checkUserLoggedIn(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TokenCubit, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is AuthenticatedState) {
          context.replaceRoute(const BottomNaviagationBarRoute());
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is UnAuthenticatedState) {
          return const SelectionScreen();
        } else {
          return Scaffold(
            body: Center(
              child: Image.asset(AssetsManager.appLogo, width: 150.w, height: 150.h,),
            ),
          );
        }
      },
    );
  }
}
