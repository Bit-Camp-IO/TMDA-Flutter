import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class TvShowsWrapperScreen extends StatelessWidget {
  const TvShowsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<TvShowsBloc>()
            ..add(GetTvShowsAiringTodayEvent())
            ..add(GetTvShowsAiringThisWeekEvent())
            ..add(GetPopularTvShowsEvent())
            ..add(GetTopRatedTvShowsEvent()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
