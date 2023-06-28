import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/movie/presentation/bloc/see_all_movies/see_all_movies_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_movies_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatefulWidget with AutoRouteWrapper{
  const SeeAllMoviesScreen({
    super.key,
    @PathParam(':seeAllMovies') required this.movieType,
    this.movieId,
  });

  final dynamic movieType;
  final int? movieId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SeeAllMoviesBloc>(),
      child: this,
    );
  }

  @override
  State<SeeAllMoviesScreen> createState() => _SeeAllMoviesScreenState();
}

class _SeeAllMoviesScreenState extends State<SeeAllMoviesScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    switch (widget.movieType) {
      case (MovieType.newMovies):
        context.read<SeeAllMoviesBloc>().add(GetAllNewMoviesEvent());
      case (MovieType.popularMovies):
        context.read<SeeAllMoviesBloc>().add(GetAllPopularMoviesEvent());
      case (MovieType.topRatedMovies):
        context.read<SeeAllMoviesBloc>().add(GetAllTopRatedMoviesEvent());
      case (MovieType.recommendedMovies):
        context
            .read<SeeAllMoviesBloc>()
            .add(GetAllRecommendedMoviesEvent(movieId: widget.movieId!));
      case (MovieType.moreMoviesLikeThis):
        context
            .read<SeeAllMoviesBloc>()
            .add(GetAllSimilarMoviesEvent(movieId: widget.movieId!));
    }
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= maxScroll * 0.9) {
      switch (widget.movieType) {
        case (MovieType.newMovies):
          context.read<SeeAllMoviesBloc>().add(GetAllNewMoviesEvent());
        case (MovieType.popularMovies):
          context.read<SeeAllMoviesBloc>().add(GetAllPopularMoviesEvent());
        case (MovieType.topRatedMovies):
          context.read<SeeAllMoviesBloc>().add(GetAllTopRatedMoviesEvent());
        case (MovieType.recommendedMovies):
          context
              .read<SeeAllMoviesBloc>()
              .add(GetAllRecommendedMoviesEvent(movieId: widget.movieId!));
        case (MovieType.moreMoviesLikeThis):
          context
              .read<SeeAllMoviesBloc>()
              .add(GetAllSimilarMoviesEvent(movieId: widget.movieId!));
      }
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 30,
            left: 20,
            child: NeonLightPainter(color: ColorsManager.primaryColor),
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
          BlocBuilder<SeeAllMoviesBloc, SeeAllMoviesState>(
            builder: (context, state) {
              switch (state.seeAllState) {
                case BlocState.loading:
                  return Center(
                    child: Lottie.asset(AssetsManager.neonLoading),
                  );
                case BlocState.success:
                  return SeeAllMoviesComponent(
                    scrollController: scrollController,
                  );
                case BlocState.failure:
                  return const Center(
                    child: Text('Load Data Failed'),
                  );
              }
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                CustomIconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: Icons.arrow_back,
                ),
                SizedBox(width: 16.w),
                Text(
                  widget.movieType.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
