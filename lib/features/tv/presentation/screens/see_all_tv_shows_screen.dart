import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows/see_all_tv_shows_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_tv_shows_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SeeAllTvShowsScreen extends StatefulWidget with AutoRouteWrapper {
  final TvShowType tvShowType;
  final int? tvShowId;

  const SeeAllTvShowsScreen({super.key, required this.tvShowType, this.tvShowId});

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
  final ScrollController scrollController = ScrollController();

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
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    final seeAllBloc = context.read<SeeAllTvShowsBloc>();
    if (currentScroll >= maxScroll * 0.9) {
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
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 30,
            left: 20,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
          ),
          const Positioned(
            bottom: 350,
            right: 0,
            child: NeonLightPainter(color: ColorsManager.secondaryColor),
          ),
          const Positioned(
            bottom: 10,
            left: 10,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
          ),
          BlocBuilder<SeeAllTvShowsBloc, SeeAllTvShowsState>(
            builder: (context, state) {
              switch (state.seeAllState) {
                case BlocState.initial || BlocState.loading:
                  return Center(
                    child: Lottie.asset(AssetsManager.neonLoading),
                  );
                case BlocState.success:
                  return SeeAllTvShowsComponent(
                    scrollController: scrollController,
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
                          seeAllBloc.add(GetAllSimilarTvShowsEvent(tvShowId: widget.tvShowId!));
                        case (TvShowType.recommendedTvShows):
                          seeAllBloc
                              .add(GetAllRecommendedTvShowsEvent(tvShowId: widget.tvShowId!));
                      }
                    },
                  );
              }
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                CustomIconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: Icons.arrow_back,
                ),
                SizedBox(width: 16.w),
                Text(
                  widget.tvShowType.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
