import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_cast_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/similar_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_overview_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_reviews_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/recommended_movies_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget implements AutoRouteWrapper{
  const MovieDetailsScreen({super.key, required this.movieId,});

  final int movieId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsCubit>()..getMovieDetails(movieId: movieId),
      child: this,
    );
  }
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> with AutoRouteAwareStateMixin<MovieDetailsScreen>{
  late ScrollController _scrollController;
  TabsRouter? _tabsRouter;

  @override
  void didChangeDependencies() {
    _tabsRouter = context.tabsRouter;
    _tabsRouter?.addListener(_tabListener);
    super.didChangeDependencies();
  }

  void _tabListener(){
    if (context.tabsRouter.activeIndex != 1) {
      context.read<MovieDetailsCubit>().getMovieStates(movieId: widget.movieId);
    }
  }
  
  @override
  void didPopNext() {
    context.read<MovieDetailsCubit>().getMovieStates(movieId: widget.movieId);
    super.didPopNext();
  }

  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonLightBackGround(
        isBackButtonActive: true,
        child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          buildWhen: (previous, current) =>
              previous.movieDetailsState != current.movieDetailsState,
          builder: (context, state) {
            switch (state.movieDetailsState) {
              case BlocState.initial || BlocState.loading:
                return Center(
                  child: Lottie.asset(AssetsManager.neonLoading),
                );
              case BlocState.success:
                return Animate(
                  effects: [FadeEffect(duration: 250.ms)],
                  child: ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    children: [
                      MovieOverviewComponent(
                        scrollController: _scrollController,
                      ),
                      const MovieCastComponent(),
                      const RecommendedMoviesComponent(),
                      const SimilarMoviesComponent(),
                      const MovieReviewsComponent(),
                      SizedBox(height: 70.h)
                    ],
                  ),
                );
              case BlocState.failure:
                return NoConnection(
                  onTap: () {
                    context.read<MovieDetailsCubit>().getMovieDetails(movieId: widget.movieId);
                  },
                );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabsRouter?.removeListener(_tabListener);
  }
}
