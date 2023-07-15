import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/episode_card.dart';

class TvShowSeasons extends StatefulWidget {
  const TvShowSeasons({super.key});

  @override
  State<TvShowSeasons> createState() => _TvShowSeasonsState();
}

class _TvShowSeasonsState extends State<TvShowSeasons>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
   final int  seasonsLength = context.read<TvShowDetailsBloc>().state.tvShowDetails.seasons.length;
    _tabController = TabController(
      length: seasonsLength > 20 ? 20 : seasonsLength,
      initialIndex: 0,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                tabs: List.generate(
                  _tabController.length,
                  (index) => Tab(
                    text: state.tvShowDetails.seasons[index].name,
                  ),
                ),
                onTap: (index) {
                  context.read<TvShowDetailsBloc>().add(ChangeSeasonsTabsIndexEvent(_tabController.index));
                  _tabController.animateTo(_tabController.index);
                },
              ),
            ),
            IndexedStack(
              index: state.seasonsTabIndex,
              children: List.generate(
                _tabController.length,
                (index) => Visibility(
                  visible: index == state.seasonsTabIndex,
                  maintainState: true,
                  maintainAnimation: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        state.allSeasonsEpisodes[state.seasonsTabIndex].length,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final episodesList = state.allSeasonsEpisodes;
                      if (episodesList.isNotEmpty) {
                        final episode = state.allSeasonsEpisodes[state.seasonsTabIndex][index];
                        return Animate(
                          effects: [FadeEffect(duration: 250.ms)],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EpisodeCard(
                              title: episode.name,
                              episodeNumber: episode.number,
                              posterPath: episode.posterPath,
                              vote: episode.voteAverage,
                              voteCount: episode.voteCount,
                              airDate: episode.airDate,
                              episodeDuration: episode.runTime,
                            ),
                          ),
                        );
                      } else {
                        return Animate(
                          effects: [FadeEffect(duration: 250.ms)],
                          child: Column(
                            children: [
                              const Center(
                                child: Text(
                                  StringsManager.noEpisodes,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
