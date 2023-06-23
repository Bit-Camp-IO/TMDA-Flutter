import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class MovieDetailsWrapperScreen extends StatelessWidget {
  const MovieDetailsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<MovieDetailsBloc>()),
      ],
      child: const AutoRouter(),
    );
  }
}
