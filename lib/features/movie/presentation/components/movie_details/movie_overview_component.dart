import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widget/simple_alert_dialog.dart';
import 'package:tmda/core/widget/section_divider.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_details_poster.dart';

class MovieOverviewComponent extends StatelessWidget {
  const MovieOverviewComponent({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      bloc: context.read<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(movieId)),
      buildWhen: (previous, current) =>
          previous.movieDetailsState != current.movieDetailsState,
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case BlocState.loading:
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          case BlocState.success:
            return Animate(
              effects: [FadeEffect(duration: 150.ms)],
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: Stack(
                      children: [
                        MovieDetailsPoster(
                          posterPath: state.movieDetails.posterPath.isNotEmpty
                              ? ApiConstants.imageUrl(state.movieDetails.posterPath)
                              : AssetsManager.noPoster,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 50,
                          child: InkWell(
                            onTap: () {
                              if (state.movieDetails.movieVideo.key.isNotEmpty) {
                                BlocProvider.of<MovieDetailsBloc>(context,listen: false).add(
                                  PlayMovieTrailerEvent(
                                    state.movieDetails.movieVideo.key,
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const SimpleAlertDialog(
                                      alertContent: StringsManager.movieDetailsAlertContent,
                                      alertButtonTitle: StringsManager.movieDetailsAlertButtonTitle,
                                    );
                                  },
                                );
                              }
                            },
                            child: SvgPicture.asset(
                              AssetsManager.neonPlayButton,
                              width: 50.w,
                              height: 50.w,
                            ),
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
                                    state.movieDetails.voteAverage.toStringAsFixed(1),
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    StringsManager.movieDetailsMaxRate,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                state.movieDetails.popularity.toString(),
                                style:Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 30,
                          bottom: 40,
                          child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                            buildWhen: (previous, current) => previous.movieAccountStatus.inWatchList != current.movieAccountStatus.inWatchList,
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  context.read<MovieDetailsBloc>().add(
                                        AddOrRemoveFromWatchListEvent(
                                          isInWatchList: !state.movieAccountStatus.inWatchList,
                                          movieId: movieId,
                                        ),
                                      );
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      state.movieAccountStatus.inWatchList
                                          ? SolarSystemIcons.favorite
                                          : SolarSystemIcons.favorite_outlined,
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
                        state.movieDetails.genres.length > 3
                            ? '${state.movieDetails.genres[0].name} / ${state.movieDetails.genres[1].name} / ${state.movieDetails.genres[2].name}'
                            : state.movieDetails.genres[0].name,
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
                              StringsManager.movieDetailsProductionYear,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                            ),
                            Text(
                              state.movieDetails.releaseDate.length > 4
                                  ? state.movieDetails.releaseDate.substring(0, 4)
                                  : StringsManager.movieUnknown,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              StringsManager.movieDetailsProductionCountry,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                            ),
                            Text(
                              state.movieDetails.movieProductionCountry.countryCode,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              StringsManager.movieDetailsLength,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                            ),
                            Text(
                              '${state.movieDetails.runTime} ${StringsManager.movieDetailsDuration}',
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

          case BlocState.failure:
            return const Text('Load data Failed');
        }
      },
    );
  }
}
