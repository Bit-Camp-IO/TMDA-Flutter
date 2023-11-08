import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_play_button.dart';
import 'package:tmda/core/widgets/error_snack_bar.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/recommended_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/similar_tv_shows_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_cast_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_overview_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_reviews_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_details_poster.dart';

class TvShowDetailsBodyComponent extends StatefulWidget {
  const TvShowDetailsBodyComponent({super.key});

  @override
  State<TvShowDetailsBodyComponent> createState() =>
      _TvShowDetailsBodyComponentState();
}

class _TvShowDetailsBodyComponentState extends State<TvShowDetailsBodyComponent> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  final ValueNotifier<double> animatedHeight = ValueNotifier(420);
  void _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (animatedHeight.value != 0) {
       animatedHeight.value = 0;
      }
    }
    if (_scrollController.position.userScrollDirection == ScrollDirection.forward && currentScroll < maxScroll * 0.03) {
      if (animatedHeight.value == 0) {
        animatedHeight.value = 420;
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      buildWhen: (previous, current) =>
          previous.tvShowDetailsState != current.tvShowDetailsState,
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 250.ms)],
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            children: [
              ValueListenableBuilder(
                valueListenable: animatedHeight,
                builder: (context, newAnimatedHeight, child) =>  AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.linear,
                  width: MediaQuery.sizeOf(context).width,
                  height: newAnimatedHeight.h,
                  child: Stack(
                    children: [
                      TvDetailsPoster(
                        height: newAnimatedHeight.h,
                        errorPosterPath: AssetsManager.errorPoster,
                        posterPath: state.tvShowDetails.posterPath,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 15.h,
                        child: NeonPlayButton(
                          onTap: () {
                            if (state.tvShowDetails.tvShowVideo.key.isNotEmpty) {
                              context.read<TvShowDetailsCubit>().playTvShowVideo();
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
                    ],
                  ),
                ),
              ),
              BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const TvShowOverview(),
                      const TvShowCastComponent(),
                      const RecommendedTvShowsComponent(),
                      const SimilarTvShowsComponent(),
                      const TvShowReviewsComponent(),
                      SizedBox(height: 70.h),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController..removeListener(_scrollListener)..dispose();
    animatedHeight.dispose();
    super.dispose();
  }
}
