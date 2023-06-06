import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/core/widget/section_widget.dart';
import 'package:tmda/features/movie/presentation/widgets/now_playing_movies_component.dart';
import 'package:tmda/features/movie/presentation/widgets/popular_movies_component.dart';
import 'package:tmda/features/movie/presentation/widgets/top_rated_movies_component.dart';
import 'package:tmda/features/movie/presentation/widgets/new_movies_component.dart';

@RoutePage()
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
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                const NowPlayingMoviesComponent(),
                SectionWidget(
                  title: 'New Movies',
                  color: ColorsManager.primaryColor,
                  textButtonTitle: 'See All',
                  textButtonColor: ColorsManager.primaryColor,
                  textButtonOnPressed: () {},
                ),
                const NewMoviesComponent(),
                SectionWidget(
                  title: 'Popular Movies',
                  color: ColorsManager.primaryColor,
                  textButtonTitle: 'See All',
                  textButtonColor: ColorsManager.primaryColor,
                  textButtonOnPressed: () {},
                ),
                const PopularMoviesComponent(),
                SectionWidget(
                  title: 'Top Rated Movies',
                  color: ColorsManager.primaryColor,
                  textButtonTitle: 'See All',
                  textButtonColor: ColorsManager.primaryColor,
                  textButtonOnPressed: () {},
                ),
                const TopRatedMoviesComponent(),
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
