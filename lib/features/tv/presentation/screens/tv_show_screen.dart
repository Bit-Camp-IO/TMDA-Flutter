import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/popular_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/tv_shows_airing_this_week_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/tv_shows_airing_today_component.dart.dart';
import 'package:tmda/features/tv/presentation/components/tv_shows/top_rated_tv_shows_component.dart';

@RoutePage()
class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned(
              top: 30,
              left: 20,
              child: NeonLightPainter(color: ColorsManager.primaryColor,),
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
            ListView(
              padding: EdgeInsets.zero,
              children: [
                const TvShowsAiringTodayComponent(),
                const TvShowsAiringThisWeekComponent(),
                const PopularTvShowsComponent(),
                const TopRatedTvShowsComponent(),
                SizedBox(height: 60.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
