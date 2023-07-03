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
                  return Row(
                    children: [
                      SizedBox(width: 16.w),
                      PosterCard(
                        onTap: () {
                          context.pushRoute(
                            MovieDetailsRoute(
                              movieId: state.popularMovies[index].id,
                            ),
                          );
                        },
                        localErrorImagePath: AssetsManager.localErrorPoster,
                        title: state.popularMovies[index].title,
                        imagePath: state.popularMovies[index].posterPath,
                        errorImagePath: AssetsManager.errorPoster,
                        releaseDate: state.popularMovies[index].releaseDate,
                        rating: state.popularMovies[index].voteAverage,
                        genres: state.popularMovies[index].genres,
                        language: state.popularMovies[index].language,
                      ),
                    ],
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
