import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_cubit/movies_cubit.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: context.tr.topRatedMoviesSectionTitle,
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            context.pushRoute(
              SeeAllMoviesRoute(
                movieType: MovieType.topRatedMovies,
              ),
            );
          },
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: CustomFadeAnimation(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final topRatedMovie = state.topRatedMovies[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0).r,
                      child: PosterCard(
                        onTap: () {
                          context.pushRoute(
                            MovieDetailsRoute(
                              movieId: topRatedMovie.id,
                            ),
                          );
                        },
                        title: topRatedMovie.title,
                        errorImagePath: AssetsManager.errorPoster,
                        imagePath: topRatedMovie.posterPath,
                        releaseYear: topRatedMovie.releaseDate,
                        rating: topRatedMovie.voteAverage,
                        genres: topRatedMovie.genres,
                        language: topRatedMovie.language,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
