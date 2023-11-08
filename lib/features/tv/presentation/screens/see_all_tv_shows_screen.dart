import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows_bloc/see_all_tv_shows_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_tv_shows_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SeeAllTvShowsScreen extends StatefulWidget implements AutoRouteWrapper {
  final TvShowType tvShowType;
  final int? tvShowId;

  const SeeAllTvShowsScreen(
      {super.key, required this.tvShowType, this.tvShowId});

  @override
  State<SeeAllTvShowsScreen> createState() => _SeeAllTvShowsScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SeeAllTvShowsBloc>(),
      child: this,
    );
  }
}

class _SeeAllTvShowsScreenState extends State<SeeAllTvShowsScreen> {
  @override
  void initState() {
    final seeAllBloc = context.read<SeeAllTvShowsBloc>();
    switch (widget.tvShowType) {
      case (TvShowType.airingToday):
        seeAllBloc.add(GetAllAiringTodayTvShowsEvent());
      case (TvShowType.popularTvShows):
        seeAllBloc.add(GetAllPopularTvShowsEvent());
      case (TvShowType.topRatedTvShows):
        seeAllBloc.add(GetAllTopRatedTvShowsEvent());
      case (TvShowType.similarTvShows):
        seeAllBloc.add(GetAllSimilarTvShowsEvent(tvShowId: widget.tvShowId!));
      case (TvShowType.recommendedTvShows):
        seeAllBloc
            .add(GetAllRecommendedTvShowsEvent(tvShowId: widget.tvShowId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonLightBackGround(
        isBackButtonActive: true,
        backButtonTitle: widget.tvShowType.name,
        child: BlocBuilder<SeeAllTvShowsBloc, SeeAllTvShowsState>(
          builder: (context, state) {
            switch (state.seeAllState) {
              case BlocState.initial || BlocState.loading:
                return Center(
                  child: Lottie.asset(AssetsManager.neonLoading),
                );
              case BlocState.success:
                return SeeAllTvShowsComponent(
                  tvShowType: widget.tvShowType,
                  tvShowId: widget.tvShowId,
                );
              case BlocState.failure:
                return NoConnection(
                  onTap: () {
                    final seeAllBloc = context.read<SeeAllTvShowsBloc>();
                    switch (widget.tvShowType) {
                      case (TvShowType.airingToday):
                        seeAllBloc.add(GetAllAiringTodayTvShowsEvent());
                      case (TvShowType.popularTvShows):
                        seeAllBloc.add(GetAllPopularTvShowsEvent());
                      case (TvShowType.topRatedTvShows):
                        seeAllBloc.add(GetAllTopRatedTvShowsEvent());
                      case (TvShowType.similarTvShows):
                        seeAllBloc.add(GetAllSimilarTvShowsEvent(
                            tvShowId: widget.tvShowId!));
                      case (TvShowType.recommendedTvShows):
                        seeAllBloc.add(GetAllRecommendedTvShowsEvent(
                            tvShowId: widget.tvShowId!));
                    }
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
