import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/poster_card.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_cubit/movies_cubit.dart';

class NewMoviesComponent extends StatelessWidget {
  const NewMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: context.tr.newMoviesSectionTitle,
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            context.pushRoute(
              SeeAllMoviesRoute(
                movieType: MovieType.newMovies,
              ),
            );
          },
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                itemCount: state.newMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final newMovie = state.newMovies[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0).r,
                    child: PosterCard(
                      onTap: () {
                        context.pushRoute(
                          MovieDetailsRoute(
                            movieId: newMovie.id,
                          ),
                        );
                      },
                      title: newMovie.title,
                      errorImagePath: AssetsManager.errorPoster,
                      imagePath: newMovie.posterPath,
                      releaseYear: newMovie.releaseDate,
                      rating: newMovie.voteAverage,
                      genres: newMovie.genres,
                      language: newMovie.language,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
