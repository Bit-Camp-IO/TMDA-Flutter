import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/neon_play_button.dart';
import 'package:tmda/core/widgets/simple_alert_dialog.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_details/tv_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_overview_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_seasons_component.dart';
import 'package:tmda/features/tv/presentation/components/tv_details_poster.dart';

class TvShowDetailsBodyComponent extends StatefulWidget {
  const TvShowDetailsBodyComponent({
    super.key,
    required this.tvShowId,
  });

  final int tvShowId;

  @override
  State<TvShowDetailsBodyComponent> createState() =>
      _TvShowDetailsBodyComponentState();
}

class _TvShowDetailsBodyComponentState extends State<TvShowDetailsBodyComponent>
    with TickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;

  double containerHeight = 420;

  void _scrollListener() {
    final tvDetailsBloc = context.read<TvDetailsBloc>();
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (tvDetailsBloc.state.animatedHeight != 0) {
        tvDetailsBloc.add(const OnScrollAnimationEvent(animatedHeight: 0));
      }
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (tvDetailsBloc.state.animatedHeight == 0) {
        tvDetailsBloc.add(const OnScrollAnimationEvent(animatedHeight: 420));
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(_scrollListener);
    context
        .read<TvDetailsBloc>()
        .add(GetSeasonEpisodesEvent(tvShowId: widget.tvShowId));
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      buildWhen: (previous, current) =>
          previous.tvShowDetailsState != current.tvShowDetailsState,
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 150.ms)],
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.zero,
            children: [
              BlocBuilder<TvDetailsBloc, TvDetailsState>(
                buildWhen: (previous, current) => previous.animatedHeight != current.animatedHeight,
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    width: MediaQuery.of(context).size.width,
                    height: state.animatedHeight,
                    child: Stack(
                      children: [
                        TvDetailsPoster(
                          height: state.animatedHeight,
                          posterPath: state.tvShowDetails.posterPath.isNotEmpty
                              ? ApiConstants.imageUrl(
                                  state.tvShowDetails.posterPath,
                                )
                              : AssetsManager.noPoster,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 15,
                          child: NeonPlayButton(
                            onTap: () {
                              if (state
                                  .tvShowDetails.tvShowVideo.key.isNotEmpty) {
                                BlocProvider.of<TvDetailsBloc>(
                                  context,
                                  listen: false,
                                ).add(
                                  PlayTvShowVideoEvent(
                                    state.tvShowDetails.tvShowVideo.key,
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
                      ],
                    ),
                  );
                },
              ),
              Column(
                children: [
                  TabBar(
                    controller: tabController,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    onTap: (value) {
                      BlocProvider.of<TvDetailsBloc>(context)
                          .add(ChangeBodyTabsIndexEvent(tabController.index));
                      tabController.animateTo(tabController.index);
                    },
                    tabs: const [
                      Tab(
                        text: 'overview',
                      ),
                      Tab(
                        text: 'Seasons',
                      )
                    ],
                  ),
                ],
              ),
              IndexedStack(
                index: state.bodyTabIndex,
                children: [
                  Visibility(
                    visible: state.bodyTabIndex == 0,
                    child: TvShowOverview(tvShowId: widget.tvShowId),
                  ),
                  Visibility(
                    visible: state.bodyTabIndex == 1,
                    child: TvShowSeasons(tvShowId: widget.tvShowId),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    tabController.dispose();
    super.dispose();
  }
}