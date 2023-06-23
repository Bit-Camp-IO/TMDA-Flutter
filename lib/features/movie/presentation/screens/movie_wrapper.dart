import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class MovieWrapperScreen extends StatelessWidget {
  const MovieWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetNewMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const AutoRouter(),
    );
  }
}
