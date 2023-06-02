import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/core/widget/section_widget.dart';
import 'package:tmda/features/movie/presentation/widgets/now_playing_movies_component.dart';
import 'package:tmda/features/movie/presentation/widgets/popular_movies_component.dart';
import 'package:tmda/features/movie/presentation/widgets/top_rated_movies_component.dart';
import 'package:tmda/features/movie/presentation/widgets/upcoming_movies_component.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 20,
              child: NeonLightPainter(
                  color: ColorsManager.primaryColor.withOpacity(0.5)),
            ),
            Positioned(
              bottom: 350,
              right: 0,
              child: NeonLightPainter(
                  color: ColorsManager.secondaryColor.withOpacity(0.5)),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: NeonLightPainter(
                  color: ColorsManager.primaryColor.withOpacity(0.6)),
            ),
            CustomScrollView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  primary: true,
                  pinned: true,
                  stretch: true,
                  backgroundColor: Colors.transparent,
                  expandedHeight: 410.h,
                  flexibleSpace: const FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: NowPlayingMoviesComponent(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SectionWidget(
                        title: 'Upcoming Movies',
                        color: ColorsManager.secondaryColor,
                        textButtonTitle: 'See All',
                        textButtonColor: ColorsManager.secondaryColor,
                        textButtonOnPressed: () {},
                      ),
                      const UpcomingMoviesComponent(),
                      SectionWidget(
                        title: 'Popular Movies',
                        color: ColorsManager.secondaryColor,
                        textButtonTitle: 'See All',
                        textButtonColor: ColorsManager.secondaryColor,
                        textButtonOnPressed: () {},
                      ),
                      const PopularMoviesComponent(),
                      SectionWidget(
                        title: 'Top Rated Movies',
                        color: ColorsManager.secondaryColor,
                        textButtonTitle: 'See All',
                        textButtonColor: ColorsManager.secondaryColor,
                        textButtonOnPressed: () {},
                      ),
                      const TopRatedMoviesComponent(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
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
