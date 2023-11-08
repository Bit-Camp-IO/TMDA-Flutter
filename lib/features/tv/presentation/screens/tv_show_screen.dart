import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/popular_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/tv_shows_airing_today_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/tv_shows_airing_this_week_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/top_rated_tv_shows_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class TvShowScreen extends StatelessWidget implements AutoRouteWrapper {
  const TvShowScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TvShowsBloc>()
        ..add(GetTvShowsAiringTodayEvent())
        ..add(GetTvShowsAiringThisWeekEvent())
        ..add(GetPopularTvShowsEvent())
        ..add(GetTopRatedTvShowsEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonLightBackGround(
        child: BlocBuilder<TvShowsBloc, TvShowsState>(
          builder: (context, state) {
            switch (state.tvShowsState) {
              case BlocState.initial || BlocState.loading:
                return Center(
                  child: Lottie.asset(AssetsManager.neonLoading),
                );
              case BlocState.success:
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const TvShowsAiringThisWeekComponent(),
                    const TvShowsAiringTodayComponent(),
                    const PopularTvShowsComponent(),
                    const TopRatedTvShowsComponent(),
                    SizedBox(height: 60.h),
                  ],
                );
              case BlocState.failure:
                return NoConnection(
                  onTap: () {
                    context.read<TvShowsBloc>()
                      ..add(GetTvShowsAiringTodayEvent())
                      ..add(GetTvShowsAiringThisWeekEvent())
                      ..add(GetPopularTvShowsEvent())
                      ..add(GetTopRatedTvShowsEvent());
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
