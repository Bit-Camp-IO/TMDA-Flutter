import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_play_button.dart';
import 'package:tmda/core/widgets/error_snack_bar.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_details_poster.dart';

class MovieOverviewComponent extends StatefulWidget {
  const MovieOverviewComponent({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<MovieOverviewComponent> createState() => _MovieOverviewComponentState();
}

class _MovieOverviewComponentState extends State<MovieOverviewComponent> {

  void _scrollListener() {
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.offset;
    final scrollDirection = widget.scrollController.position.userScrollDirection;
    final movieDetailsBloc = context.read<MovieDetailsBloc>();
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (movieDetailsBloc.state.animatedContainerHeight != 0 &&
          movieDetailsBloc.state.animatedPosterHeight != 0) {
        movieDetailsBloc.add(
          const OnScrollAnimationEvent(
            animatedContainerHeight: 50,
            animatedPosterHeight: 0,
          ),
        );
      }
    }
    if (scrollDirection == ScrollDirection.forward && currentScroll < maxScroll * 0.05) {
      if (movieDetailsBloc.state.animatedContainerHeight == 50 && movieDetailsBloc.state.animatedPosterHeight == 0) {
        movieDetailsBloc.add(
          const OnScrollAnimationEvent(
            animatedContainerHeight: 500,
            animatedPosterHeight: 420,
          ),
        );
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
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 150.ms)],
          child: Column(
            children: [
              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                buildWhen: (previous, current) => previous.animatedContainerHeight != current.animatedContainerHeight,
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: MediaQuery.sizeOf(context).width,
                    curve: Curves.linear,
                    height: state.animatedContainerHeight.h,
                    child: Stack(
                      children: [
                        MovieDetailsPoster(
                          posterPath: state.movieDetails.posterPath,
                          errorPosterPath: AssetsManager.errorPoster,
                          height: state.animatedPosterHeight,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 70.h,
                          child: NeonPlayButton(
                            onTap: () {
                              if (state.movieDetails.video.key.isNotEmpty) {
                                context.read<MovieDetailsBloc>().add(
                                  PlayMovieTrailerEvent(
                                    state.movieDetails.video.key,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  errorSnackBar(
                                    errorMessage: StringsManager.movieNoVideosMessage,
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
                                    state.movieDetails.voteAverage.toStringAsFixed(1),
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    StringsManager.maxRate,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                state.movieDetails.popularity.toString(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 30.w,
                          bottom: 40.h,
                          child:
                              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  context.read<MovieDetailsBloc>().add(
                                        AddOrRemoveFromWatchListEvent(
                                          isInWatchList: !state.movieDetails.accountStates.inWatchList,
                                          movieId: state.movieDetails.id,
                                        ),
                                      );
                                },
                                child: Column(
                                  children: [
                                    AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 350),
                                      child: Icon(
                                        state.movieDetails.accountStates.inWatchList
                                            ? SolarSystemIcons.saved
                                            : SolarSystemIcons.unsaved,
                                        color: ColorsManager.primaryColor,
                                        size: 30.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
                        Text(StringsManager.productionYear,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorsManager.inActiveColor,
                                  ),
                        ),
                        Text(state.movieDetails.releaseDate.length > 4
                              ? state.movieDetails.releaseDate.substring(0, 4)
                              : StringsManager.unknown,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(StringsManager.productionCountry,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorsManager.inActiveColor,
                                  ),
                        ),
                        Text(state.movieDetails.productionCountry.countryCode,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(StringsManager.length,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: ColorsManager.inActiveColor,
                                  ),
                        ),
                        Text('${state.movieDetails.runTime} ${StringsManager.duration}',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0).r,
                child: Text(
                  state.movieDetails.overview,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
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
      return StringsManager.unknown;
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
    super.dispose();
  }
}
