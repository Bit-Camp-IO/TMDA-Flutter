import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/core/widgets/see_all_card.dart';
import 'package:tmda/features/auth/presentation/widgets/no_connection.dart';
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SearchScreen extends StatefulWidget with AutoRouteWrapper {
  const SearchScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>(),
      child: this,
    );
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: Stack(
        children: [
          const Positioned(
            top: 30,
            left: 20,
            child: NeonLightPainter(
              color: ColorsManager.primaryColor,
            ),
          ),
          const Positioned(
            bottom: 350,
            right: 0,
            child: NeonLightPainter(color: ColorsManager.secondaryColor),
          ),
          const Positioned(
            bottom: 10,
            left: 10,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              switch (state.searchState) {
                case BlocState.initial:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          SolarSystemIcons.search,
                          color: ColorsManager.primaryColor,
                          size: 70,
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Search for what you want.',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ColorsManager.primaryColor),
                        ),
                        Text(
                          'Movies, TvShows, Persons.',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 16,
                                  color: ColorsManager.darkPrimary),
                        ),
                      ],
                    ),
                  );
                case BlocState.loading:
                  return Center(
                    child: Lottie.asset(AssetsManager.neonLoading),
                  );
                case BlocState.success:
                  return ListView.builder(
                    itemCount: state.movieSearchList.length,
                    padding: const EdgeInsets.symmetric(vertical: 100).r,
                    itemBuilder: (context, index) {
                      print('>>>>>>>>>>>>>${state.movieSearchList.length}<<<<<<<<<<<');
                      if(state.movieSearchList.isNotEmpty){
                        return Animate(
                          effects: [FadeEffect(duration: 250.ms)],
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 14,
                            ).r,
                            child: BlocBuilder<SearchBloc, SearchState>(
                              builder: (context, state) {
                                return SeeAllCard(
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
                                  releaseYear:
                                  state.movieSearchList[index].releaseDate,
                                  language: state.movieSearchList[index].language,
                                  isInWatchList: state.movieSearchList[index]
                                      .contentStates.inWatchList,
                                  onSaved: () {},
                                  errorImagePath: AssetsManager.noPoster,
                                );
                              },
                            ),
                          ),
                        );
                      }else{
                        return Animate(
                          effects: [FadeEffect(duration: 250.ms)],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  SolarSystemIcons.error,
                                  color: ColorsManager.secondaryColor,
                                  size: 70,
                                ),
                                SizedBox(height: 30.h),
                                Text(
                                  "Couldn't find what you are looking for.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: ColorsManager.secondaryColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                case BlocState.failure:
                  return NoConnection(
                    onTap: () {
                      context.read<SearchBloc>().add(
                          SearchForMovieEvent(_textEditingController.text));
                    },
                  );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 34, right: 24).r,
            child: SizedBox(
              height: 50.h,
              child: TextField(
                onChanged: (value) =>
                    context.read<SearchBloc>().add(SearchForMovieEvent(value)),
                controller: _textEditingController,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
                cursorColor: ColorsManager.primaryColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.37),
                  hintText: 'Search..',
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.inActiveColor,
                      ),
                  prefixIcon: const Icon(
                    SolarSystemIcons.search,
                    color: ColorsManager.inActiveColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
