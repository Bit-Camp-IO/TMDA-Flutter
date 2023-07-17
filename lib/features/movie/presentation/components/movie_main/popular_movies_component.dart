import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/core/widgets/poster_card.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
        BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                itemCount: state.popularMovies.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final popularMovie = state.popularMovies[index];
                  return Padding(
                    padding: const EdgeInsets.only(left : 16.0).r,
                    child: PosterCard(
                      onTap: () {
                        context.pushRoute(
                          MovieDetailsRoute(
                            movieId: popularMovie.id,
                          ),
                        );
                      },
                      title: popularMovie.title,
                      imagePath: popularMovie.posterPath,
                      errorImagePath: AssetsManager.errorPoster,
                      releaseYear: popularMovie.releaseDate,
                      rating: popularMovie.voteAverage,
                      genres: popularMovie.genres,
                      language: popularMovie.language,
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
