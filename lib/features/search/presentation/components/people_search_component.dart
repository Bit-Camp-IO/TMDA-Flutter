import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmda/features/search/presentation/components/no_search_results.dart';
import 'package:tmda/features/search/presentation/components/person_card.dart';
import 'package:tmda/features/search/presentation/components/search_initial_body.dart';

class PeopleSearchComponent extends StatefulWidget {
  const PeopleSearchComponent({
    super.key,
    required this.searchInput,
  });

  final String searchInput;

  @override
  State<PeopleSearchComponent> createState() => _PeopleSearchComponentState();
}

class _PeopleSearchComponentState extends State<PeopleSearchComponent> {
  late ScrollController _scrollController;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll * 0.9) {
      context.read<SearchBloc>().add(LoadMorePersonsEvent(widget.searchInput));
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
        if (state.peopleSearchList.isEmpty && widget.searchInput.isNotEmpty) {
          return const NoSearchResults();
        } else if (state.peopleSearchList.isEmpty &&
            widget.searchInput.isEmpty) {
          return const SearchInitialBody();
        } else {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.peopleSearchList.length + 1,
            itemBuilder: (context, index) {
              if (index >= state.peopleSearchList.length) {
                if (state.peopleSearchList.length < 20) {
                  return const SizedBox();
                } else {
                  return Center(
                    child: Lottie.asset(AssetsManager.neonLoading, width: 200),
                  );
                }
              } else {
                return Animate(
                  effects: [FadeEffect(duration: 250.ms)],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 14,
                    ).r,
                    child: PersonCard(
                      name: state.peopleSearchList[index].name,
                      knownFor:
                      state.peopleSearchList[index].knowingFor,
                      imagePath:
                      state.peopleSearchList[index].profilePath,
                      errorAvatarPath: AssetsManager.neonAvatar,
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.pushRoute(
                          PersonRoute(
                            personId: state.peopleSearchList[index].id,
                            personScreenType:
                            PersonScreenType.withAllContent,
                          ),
                        );
                      },
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
