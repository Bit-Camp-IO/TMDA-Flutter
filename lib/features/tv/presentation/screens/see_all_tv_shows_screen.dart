import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_details/tv_details_bloc.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_airing_this_week_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_airing_today_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_popular_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_recommended_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_see_all/see_all_similar_tv_shows_component.dart';

@RoutePage()
class SeeAllTvShowsScreen extends StatefulWidget {
  const SeeAllTvShowsScreen({super.key,@PathParam(':seeAllTvShow') required this.tvShowType, this.tvShowId});
  final dynamic tvShowType;
  final int? tvShowId;
  @override
  State<SeeAllTvShowsScreen> createState() => _SeeAllTvShowsScreenState();
}

class _SeeAllTvShowsScreenState extends State<SeeAllTvShowsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    final tvShowBloc = context.read<TvShowsBloc>();
    final tvDetailsBloc = context.read<TvDetailsBloc>();
    if (currentScroll >= maxScroll * 0.9) {
      switch (widget.tvShowType) {
        case (TvShowType.airingThisWeek):
          tvShowBloc.add(GetTvShowsAiringThisWeekEvent());
        case (TvShowType.popularTvShows):
          tvShowBloc.add(GetPopularTvShowsEvent());
        case (TvShowType.topRatedTvShows):
          tvShowBloc.add(GetTopRatedTvShowsEvent());
        case(TvShowType.similarTvShows):
          tvDetailsBloc.add(GetMoreSimilarTvShowsEvent(widget.tvShowId!));
        case(TvShowType.recommendedTvShows):
          tvDetailsBloc.add(GetMoreRecommendedTvShowsEvent(widget.tvShowId!));
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
    TvShowType tvShowType = widget.tvShowType as TvShowType;
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
          Builder(
            builder: (context) {
              switch (tvShowType) {
                case (TvShowType.topRatedTvShows):
                  return SeeAllTopRatedComponent(
                    scrollController: scrollController,
                  );
                case (TvShowType.airingThisWeek):
                  return SeeAllAiringThisWeekComponent(
                    scrollController: scrollController,
                  );
                case (TvShowType.popularTvShows):
                  return SeeAllPopularTvShowsComponent(
                    scrollController: scrollController,
                  );
                case (TvShowType.recommendedTvShows):
                  return SeeAllRecommendedTvShowsComponent(
                    scrollController: scrollController,
                  );
                case (TvShowType.similarTvShows):
                  return SeeAllSimilarTvShowsComponent(
                    scrollController: scrollController,
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
