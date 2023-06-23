import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/details_poster_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

class MoviesLikeThisComponent extends StatelessWidget {
  const MoviesLikeThisComponent({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidgetWithSeeAll(
          title: StringsManager.movieDetailsSimilarSectionTitle,
          color: ColorsManager.primaryColor,
          textButtonOnPressed: () {
            AutoRouter.of(context).push(
              SeeAllMoviesRoute(
                movieId: movieId,
                movieType: MovieType.moreMoviesLikeThis,
              ),
            );
          },
        ),
        BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          buildWhen: (previous, current) =>
              previous.movieDetailsState != current.movieDetailsState,
          builder: (context, state) {
            if (state.movieDetails.similarMovies.isNotEmpty) {
              return Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 220.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.movieDetails.similarMovies.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 16.w),
                            MovieDetailsPosterCard(
                              imagePath: state.movieDetails.similarMovies[index]
                                      .posterPath.isNotEmpty
                                  ? ApiConstants.imageUrl(
                                      state.movieDetails.similarMovies[index]
                                          .posterPath,
                                    )
                                  : AssetsManager.noPoster,
                              title:
                                  state.movieDetails.similarMovies[index].title,
                              rating: state
                                  .movieDetails.similarMovies[index].voteAverage,
                              onTap: () {
                                AutoRouter.of(context).push(
                                  MovieDetailsWrapperRoute(
                                    children: [
                                      MovieDetailsRoute(
                                        movieId: state
                                            .movieDetails.similarMovies[index].id,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SectionDivider(),
                ],
              );
            } else {
              return Animate(
                effects: [FadeEffect(duration: 150.ms)],
                child: Column(
                  children: [
                    const SectionWidget(
                      title: StringsManager.movieDetailsSimilarSectionTitle,
                      color: ColorsManager.primaryColor,
                    ),
                    Center(
                      child: Text(
                        'We couldn\'t find movies like this.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
