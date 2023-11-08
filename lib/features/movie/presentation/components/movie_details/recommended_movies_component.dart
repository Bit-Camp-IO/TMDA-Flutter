import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/details_poster_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart';

class RecommendedMoviesComponent extends StatelessWidget {
  const RecommendedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state.movieDetails.recommendedMovies.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: StringsManager.detailsRecommendedSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllMoviesRoute(
                        movieId: state.movieDetails.id,
                        movieType: MovieType.recommendedMovies,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 220.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieDetails.recommendedMovies.length,
                    itemBuilder: (context, index) {
                      final recommendedMovie = state.movieDetails.recommendedMovies[index];
                      return Padding(
                        padding: const EdgeInsets.only(left : 16.0).r,
                        child: DetailsPosterCard(
                          imagePath: recommendedMovie.posterPath,
                          errorImagePath: AssetsManager.errorPoster,
                          title: recommendedMovie.title,
                          rating: recommendedMovie.voteAverage,
                          onTap: () {
                            context.pushRoute(
                              MovieDetailsRoute(
                                movieId: recommendedMovie.id,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SectionDivider(),
              ],
            ),
          );
        } else {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.detailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    StringsManager.noRecommendedMovies,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                SizedBox(height: 20.h),
                const SectionDivider(),
              ],
            ),
          );
        }
      },
    );
  }
}
