import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/core/widget/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/now_playing_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/popular_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/top_rated_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/new_movies_component.dart';

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
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                const NowPlayingMoviesComponent(),
                SectionWidgetWithSeeAll(
                  title: StringsManager.newMoviesSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllMoviesRoute(
                        movieType: MovieType.newMovies,
                      ),
                    );
                  },
                ),
                const NewMoviesComponent(),
                SectionWidgetWithSeeAll(
                  title: StringsManager.popularMoviesSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllMoviesRoute(
                        movieType: MovieType.popularMovies,
                      ),
                    );
                  },
                ),
                const PopularMoviesComponent(),
                SectionWidgetWithSeeAll(
                  title: StringsManager.topRatedMoviesSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllMoviesRoute(
                        movieType: MovieType.topRatedMovies,
                      ),
                    );
                  },
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
