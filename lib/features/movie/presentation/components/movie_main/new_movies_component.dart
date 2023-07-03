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

class NewMoviesComponent extends StatelessWidget {
  const NewMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
        BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            return SizedBox(
              height: 260.h,
              child: ListView.builder(
                itemCount: state.newMovies.length,
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
                              movieId: state.newMovies[index].id,
                            ),
                          );
                        },
                        localErrorImagePath: AssetsManager.localErrorPoster,
                        title: state.newMovies[index].title,
                        errorImagePath: AssetsManager.errorPoster,
                        imagePath: state.newMovies[index].posterPath,
                        releaseDate: state.newMovies[index].releaseDate,
                        rating: state.newMovies[index].voteAverage,
                        genres: state.newMovies[index].genres,
                        language: state.newMovies[index].language,
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
