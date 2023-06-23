import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_details/tv_details_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class TvShowDetailsWrapperScreen extends StatelessWidget {
  const TvShowDetailsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TvDetailsBloc>()
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
