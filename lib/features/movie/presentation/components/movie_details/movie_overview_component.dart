import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_play_button.dart';
import 'package:tmda/core/widgets/simple_alert_dialog.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_details_poster.dart';

class MovieOverviewComponent extends StatefulWidget {
  const MovieOverviewComponent({
    super.key,
    required this.movieId,
    required this.scrollController,
  });

  final int movieId;
  final ScrollController scrollController;

  @override
  State<MovieOverviewComponent> createState() => _MovieOverviewComponentState();
}

class _MovieOverviewComponentState extends State<MovieOverviewComponent> {
  void _scrollListener() {
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
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (movieDetailsBloc.state.animatedContainerHeight == 50 &&
          movieDetailsBloc.state.animatedPosterHeight == 0) {
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
                buildWhen: (previous, current) =>
                    previous.animatedContainerHeight !=
                    current.animatedContainerHeight,
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: MediaQuery.of(context).size.width,
                    curve: Curves.linear,
                    height: state.animatedContainerHeight,
                    child: Stack(
                      children: [
                        MovieDetailsPoster(
                          posterPath: state.movieDetails.posterPath.isNotEmpty
                              ? ApiConstants.imageUrl(
                                  state.movieDetails.posterPath)
                              : AssetsManager.noPoster,
                          height: state.animatedPosterHeight,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 50,
                          child: NeonPlayButton(
                            onTap: () {
                              if (state.movieDetails.video.key.isNotEmpty) {
                                BlocProvider.of<MovieDetailsBloc>(
                                  context,
                                  listen: false,
                                ).add(
                                  PlayMovieTrailerEvent(
                                    state.movieDetails.video.key,
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const SimpleAlertDialog(
                                      alertContent: StringsManager
                                          .movieDetailsAlertContent,
                                      alertButtonTitle: StringsManager
                                          .movieDetailsAlertButtonTitle,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        Positioned(
                          left: 30,
                          bottom: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                SolarSystemIcons.star,
                                color: ColorsManager.starsColor,
                                size: 30,
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Text(
                                    state.movieDetails.voteAverage
                                        .toStringAsFixed(1),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    StringsManager.maxRate,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                          right: 30,
                          bottom: 40,
                          child:
                              BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  context.read<MovieDetailsBloc>().add(
                                        AddOrRemoveFromWatchListEvent(
                                          isInWatchList: !state
                                              .movieDetails.status.inWatchList,
                                          movieId: widget.movieId,
                                        ),
                                      );
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      state.movieDetails.status.inWatchList
                                          ? SolarSystemIcons.save_outlined
                                          : SolarSystemIcons.save,
                                      color: ColorsManager.primaryColor,
                                      size: 30,
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 20,
                child: Center(
                  child: Text(
                    (() {
                      if (state.movieDetails.genres.isEmpty) {
                        return 'Unknown';
                      } else if (state.movieDetails.genres.length == 1) {
                        return state.movieDetails.genres[0].name;
                      } else {
                        return '${state.movieDetails.genres[0].name}/${state.movieDetails.genres[1].name}/${state.movieDetails.genres[2].name}';
                      }
                    }()),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          StringsManager.productionYear,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                        ),
                        Text(
                          state.movieDetails.releaseDate.length > 4
                              ? state.movieDetails.releaseDate.substring(0, 4)
                              : StringsManager.unknown,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          StringsManager.productionCountry,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                        ),
                        Text(
                          state.movieDetails.productionCountry.countryCode,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          StringsManager.length,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                        ),
                        Text(
                          '${state.movieDetails.runTime} ${StringsManager.duration}',
                          style: Theme.of(context).textTheme.titleMedium,
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

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }
}
