import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card.dart';
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmda/features/search/presentation/components/no_search_results.dart';
import 'package:tmda/features/search/presentation/components/search_initial_body.dart';

class TvShowsSearchComponent extends StatefulWidget {
  const TvShowsSearchComponent({
    super.key,
    required this.searchInput,
  });

  final String searchInput;

  @override
  State<TvShowsSearchComponent> createState() => _TvShowsSearchComponentState();
}

class _TvShowsSearchComponentState extends State<TvShowsSearchComponent> {
  late ScrollController _scrollController;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll * 0.9) {
      context.read<SearchBloc>().add(LoadMoreTvShowsEvent(widget.searchInput));
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.tvSearchList.isEmpty && widget.searchInput.isNotEmpty) {
          return const NoSearchResults();
        } else if (state.tvSearchList.isEmpty && widget.searchInput.isEmpty) {
          return const SearchInitialBody();
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.tvSearchList.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.tvSearchList.length) {
                if (state.tvSearchList.length < 20) {
                  return const SizedBox();
                } else {
                  return Center(
                    child: Lottie.asset(
                      AssetsManager.neonLoading,
                      width: 200.w,
                    ),
                  );
                }
              } else {
                final tvShow = state.tvSearchList[index];
                return CustomFadeAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 14,
                    ).r,
                    child: ListCard(
                      title: tvShow.title,
                      posterPath: tvShow.posterPath,
                      errorImagePath: AssetsManager.errorPoster,
                      vote: tvShow.voteAverage,
                      voteCount: tvShow.voteCount,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.pushRoute(
                          TvDetailsRoute(
                            tvShowId: tvShow.id,
                          ),
                        );
                      },
                      genres: tvShow.genres,
                      releaseYear: tvShow.firstAirDate,
                      language: tvShow.language,
                    ),
                  ),
                );
              }
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
