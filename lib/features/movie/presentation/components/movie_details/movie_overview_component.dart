import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/error_snack_bar.dart';
import 'package:tmda/core/widgets/neon_play_button.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:tmda/features/movie/presentation/components/movie_details_poster.dart';
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';

class MovieOverviewComponent extends StatefulWidget {
  final ScrollController scrollController;
  final int movieId;
  const MovieOverviewComponent({
    super.key,
    required this.scrollController,
    required this.movieId,
  });

  @override
  State<MovieOverviewComponent> createState() => _MovieOverviewComponentState();
}

class _MovieOverviewComponentState extends State<MovieOverviewComponent> {
  final ValueNotifier<double> animatedContainerHeight = ValueNotifier(500);
  final ValueNotifier<double> animatedPosterHeight = ValueNotifier(420);

  void _scrollListener() {
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.offset;
    final scrollDirection =
        widget.scrollController.position.userScrollDirection;
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (animatedContainerHeight.value != 0 &&
          animatedPosterHeight.value != 0) {
        animatedContainerHeight.value = 50;
        animatedPosterHeight.value = 0;
      }
    }
    if (scrollDirection == ScrollDirection.forward &&
        currentScroll < maxScroll * 0.05) {
      if (animatedContainerHeight.value == 50 &&
          animatedPosterHeight.value == 0) {
        animatedContainerHeight.value = 500;
        animatedPosterHeight.value = 420;
      }
    }
  }

  @override
  initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        return CustomFadeAnimation(
          duration: Duration(milliseconds: 150),
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: animatedContainerHeight,
                builder: (context, newAnimatedContainerHeight, child) =>
                    AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: MediaQuery.sizeOf(context).width,
                  curve: Curves.linear,
                  height: newAnimatedContainerHeight.h,
                  child: Stack(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: animatedPosterHeight,
                        builder: (context, newAnimatedPosterHeight, child) =>
                            MovieDetailsPoster(
                          posterPath: state.movieDetails.posterPath,
                          errorPosterPath: AssetsManager.errorPoster,
                          height: newAnimatedPosterHeight.h,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 65.h,
                        child: NeonPlayButton(
                          onTap: () {
                            if (state.movieDetails.video.key.isNotEmpty) {
                              context
                                  .read<MovieDetailsCubit>()
                                  .playMovieTrailer();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                errorSnackBar(
                                  errorMessage: context.tr.movieNoVideosMessage,
                                  context: context,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Positioned(
                        left: 30.w,
                        bottom: 5.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              SolarSystemIcons.star,
                              color: ColorsManager.ratingIconColor,
                              size: 30.sp,
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Text(
                                  state.movieDetails.voteAverage
                                      .toStringAsFixed(1),
                                  style: context.textTheme.titleMedium,
                                ),
                                Text(
                                  context.tr.maxRate,
                                  style: context.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              state.movieDetails.popularity.toString(),
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30.w,
                        bottom: 40.h,
                        child: BlocBuilder<WatchListBloc, WatchListState>(
                          builder: (context, state) {
                            final isInWatchList = state.moviesWatchListIdsSet
                                .contains(widget.movieId);
                            return InkWell(
                              onTap: () {
                                context.read<WatchListBloc>().add(
                                    AddOrRemoveMovieFromWatchListEvent(
                                        movieId: widget.movieId,
                                        isInWatchList: !isInWatchList));
                              },
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 350),
                                child: isInWatchList
                                    ? Icon(
                                        SolarSystemIcons.saved,
                                        color: ColorsManager.primaryColor,
                                        size: 30.sp,
                                      )
                                    : Icon(
                                        SolarSystemIcons.unsaved,
                                        color: ColorsManager.primaryColor,
                                        size: 30.sp,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: const SectionDivider(),
              ),
              Text(
                state.movieDetails.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 20.h,
                child: Center(
                  child: Text(
                    _buildGenre(state.movieDetails.genres),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.inActiveColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          context.tr.productionYear,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: ColorsManager.inActiveColor,
                          ),
                        ),
                        Text(
                          state.movieDetails.releaseDate.length > 4
                              ? state.movieDetails.releaseDate.substring(0, 4)
                              : context.tr.unknown,
                          style: context.textTheme.titleMedium,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          context.tr.productionCountry,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: ColorsManager.inActiveColor,
                          ),
                        ),
                        Text(
                          state.movieDetails.productionCountry.countryCode,
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          context.tr.length,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: ColorsManager.inActiveColor,
                          ),
                        ),
                        Text(
                          '${state.movieDetails.runTime} ${context.tr.duration}',
                          style: context.textTheme.titleMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0)
                        .r,
                child: Text(
                  state.movieDetails.overview,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SectionDivider(),
            ],
          ),
        );
      },
    );
  }

  String _buildGenre(List genres) {
    if (genres.isEmpty) {
      return context.tr.unknown;
    } else if (genres.length == 1) {
      return genres[0].name;
    } else if (genres.length == 2) {
      return '${genres[0].name}/${genres[1].name}';
    } else {
      return '${genres[0].name}/${genres[1].name}/${genres[2].name}';
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    animatedContainerHeight.dispose();
    animatedPosterHeight.dispose();
    super.dispose();
  }
}
