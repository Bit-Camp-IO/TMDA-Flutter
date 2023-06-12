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
import 'package:tmda/core/widget/details_poster_card.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

class MoviesLikeThisComponent extends StatelessWidget {
  const MoviesLikeThisComponent({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      bloc: context.read<MovieDetailsBloc>()
        ..add(GetMoviesLikeThisEvent(movieId)),
      buildWhen: (previous, current) =>
          previous.moviesLikeThisState != current.moviesLikeThisState,
      builder: (context, state) {
        switch (state.moviesLikeThisState) {
          case BlocState.loading:
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );

          case BlocState.success:
            return Animate(
              effects: [FadeEffect(duration: 150.ms)],
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.moviesLikeThis.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0).r,
                      child: DetailsPosterCard(
                        imagePath:
                            state.moviesLikeThis[index].moviePosterPath.isNotEmpty
                                ? ApiConstants.imageUrl(state.moviesLikeThis[index].moviePosterPath)
                                : AssetsManager.noPoster,
                        title: state.moviesLikeThis[index].movieTitle,
                        rating: state.moviesLikeThis[index].movieVote,
                        onTap: () {
                          AutoRouter.of(context).push(
                            MovieDetailsWrapperRoute(
                              children: [
                                MovieDetailsRoute(
                                  movieId: state.moviesLikeThis[index].movieId,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );

          case BlocState.failure:
            return const Text('Load data Failed');
        }
      },
    );
  }
}
