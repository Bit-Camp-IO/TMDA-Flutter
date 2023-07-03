import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/widgets/list_card.dart';
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmda/features/search/presentation/components/no_search_results.dart';
import 'package:tmda/features/search/presentation/components/search_initial_body.dart';

class MoviesSearchComponent extends StatefulWidget {
  final String searchInput;

  const MoviesSearchComponent({super.key, required this.searchInput});

  @override
  State<MoviesSearchComponent> createState() => _MoviesSearchComponentState();
}

class _MoviesSearchComponentState extends State<MoviesSearchComponent> {
  late ScrollController _scrollController;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll * 0.9) {
      context.read<SearchBloc>().add(LoadMoreMoviesEvent(widget.searchInput));
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
        if (state.movieSearchList.isEmpty && widget.searchInput.isNotEmpty) {
          return const NoSearchResults();
        } else if (state.movieSearchList.isEmpty &&
            widget.searchInput.isEmpty) {
          return const SearchInitialBody();
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.movieSearchList.length + 1,
            itemBuilder: (context, index) {
              return index >= state.movieSearchList.length
                  ? Center(
                      child:
                          Lottie.asset(AssetsManager.neonLoading, width: 200),
                    )
                  : Animate(
                      effects: [FadeEffect(duration: 250.ms)],
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 14,
                        ).r,
                        child: ListCard(
                          title: state.movieSearchList[index].title,
                          posterPath: state.movieSearchList[index].posterPath,
                          vote: state.movieSearchList[index].voteAverage,
                          voteCount: state.movieSearchList[index].voteCount,
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.pushRoute(
                              MovieDetailsRoute(
                                  movieId: state.movieSearchList[index].id),
                            );
                          },
                          genres: state.movieSearchList[index].genres,
                          releaseYear: state.movieSearchList[index].releaseDate,
                          language: state.movieSearchList[index].language,
                          errorImagePath: AssetsManager.noPoster,
                        ),
                      ),
                    );
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
