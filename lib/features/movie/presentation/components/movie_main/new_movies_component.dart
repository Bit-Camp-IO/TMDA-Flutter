import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widget/poster_card.dart';
import 'package:tmda/core/widget/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';

class NewMoviesComponent extends StatelessWidget {
  const NewMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.newMovies.isEmpty ||
          previous.newMovies[10] != current.newMovies[10],
      builder: (context, state) {
        switch (state.newMoviesState) {
          case BlocState.loading:
            return SizedBox(
              height: 270.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          case BlocState.success:
            return Column(
              children: [
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
                SizedBox(
                  height: 280.h,
                  child: Animate(
                    effects: [FadeEffect(duration: 250.ms)],
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 24.w),
                            PosterCard(
                              onTap: () {
                                context.pushRoute(
                                  MovieDetailsRoute(
                                    movieId: state.newMovies[index].movieId,
                                  ),
                                );
                              },
                              title: state.newMovies[index].movieTitle,
                              imagePath: ApiConstants.imageUrl(state.newMovies[index].moviePosterPath),
                              releaseDate: state.newMovies[index].movieReleaseDate,
                              rating: state.newMovies[index].movieVote,
                              genres: state.newMovies[index].movieGenres,
                              language: state.newMovies[index].movieLanguage,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          case (BlocState.failure):
            return const Text('There was an error');
        }
      },
    );
  }
}
