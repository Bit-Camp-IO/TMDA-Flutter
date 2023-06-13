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

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) => previous.popularMoviesState != current.popularMoviesState,
      builder: (context, state) {
        switch (state.popularMoviesState) {
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
                                    movieId: state.popularMovies[index].id,
                                  ),
                                );
                              },
                              title: state.popularMovies[index].title,
                              imagePath: ApiConstants.imageUrl(state.popularMovies[index].posterPath),
                              releaseDate: state.popularMovies[index].releaseDate,
                              rating: state.popularMovies[index].voteAverage,
                              genres: state.popularMovies[index].genres,
                              language: state.popularMovies[index].language,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          case BlocState.failure:
            return const Text('There Was an error');
        }
      },
    );
  }
}
