import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/auth/presentation/cubit/login_cubit.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthCubit>()..checkUserLoggedIn(),
        ),
        BlocProvider(
          create: (context) => getIt<LoginCubit>(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
