import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widget/custom_icon_button.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_movies_like_this_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_new_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_popular_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_top_rated_movies_component.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatefulWidget {
  const SeeAllMoviesScreen(
      {super.key, @PathParam(':seeAllMoviesType') required this.movieType, this.movieId});
  final dynamic movieType;
  final int? movieId;
  @override
  State<SeeAllMoviesScreen> createState() => _SeeAllMoviesScreenState();
}

class _SeeAllMoviesScreenState extends State<SeeAllMoviesScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= maxScroll * 0.9) {
      switch (widget.movieType) {
        case (MovieType.newMovies):
          context.read<MoviesBloc>().add(GetNewMoviesEvent());
        case (MovieType.popularMovies):
          context.read<MoviesBloc>().add(GetPopularMoviesEvent());
        case (MovieType.topRatedMovies):
          context.read<MoviesBloc>().add(GetTopRatedMoviesEvent());
        case (MovieType.moreLikeThisMovies):
          context.read<MovieDetailsBloc>().add( GetMoviesLikeThisEvent(widget.movieId!));
      }
    }
  }

  @override
  void dispose() {
    scrollController..removeListener(_onScroll)..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MovieType movieType = widget.movieType as MovieType;
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
          Builder(
            builder: (context) {
              switch (movieType) {
                case (MovieType.newMovies):
                  return SeeAllNewMoviesComponent(
                    scrollController: scrollController,
                  );
                case (MovieType.popularMovies):
                  return SeeAllPopularMoviesComponent(
                    scrollController: scrollController,
                  );
                case (MovieType.moreLikeThisMovies):
                  return SeeAllMoviesLikeThisComponent(
                    scrollController: scrollController,
                  );
                case (MovieType.topRatedMovies):
                  return SeeAllTopRatedMoviesComponent(
                    scrollController: scrollController,
                  );
              }
            },
          ),
          Positioned(
            top: 30,
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
