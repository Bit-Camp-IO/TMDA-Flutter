// ignore_for_file: unused_import

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/movie/presentation/bloc/see_all_movies/see_all_movies_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_see_all/see_all_movies_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class SeeAllMoviesScreen extends StatefulWidget implements AutoRouteWrapper{
  const SeeAllMoviesScreen({super.key, required this.movieType, this.movieId});

  final MovieType movieType;
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
  @override
  void initState() {
    final seeAllBloc =  context.read<SeeAllMoviesBloc>();
    switch (widget.movieType) {
      case (MovieType.newMovies):
        seeAllBloc.add(GetAllNewMoviesEvent());
      case (MovieType.popularMovies):
        seeAllBloc.add(GetAllPopularMoviesEvent());
      case (MovieType.topRatedMovies):
        seeAllBloc.add(GetAllTopRatedMoviesEvent());
      case (MovieType.recommendedMovies):
        seeAllBloc.add(GetAllRecommendedMoviesEvent(movieId: widget.movieId!));
      case (MovieType.similarMovies):
        seeAllBloc.add(GetAllSimilarMoviesEvent(movieId: widget.movieId!));
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonLightBackGround(
        isBackButtonActive: true,
        backButtonTitle: widget.movieType.name,
        child: BlocBuilder<SeeAllMoviesBloc, SeeAllMoviesState>(
          builder: (context, state) {
            switch (state.seeAllState) {
              case BlocState.initial || BlocState.loading:
                return Center(
                  child: Lottie.asset(AssetsManager.neonLoading),
                );
              case BlocState.success:
                return SeeAllMoviesComponent(
                 movieType: widget.movieType,
                  movieId: widget.movieId,
                );
              case BlocState.failure:
                return NoConnection(
                  onTap: () {
                    final seeAllBloc =  context.read<SeeAllMoviesBloc>();
                    switch (widget.movieType) {
                      case (MovieType.newMovies):
                        seeAllBloc.add(GetAllNewMoviesEvent());
                      case (MovieType.popularMovies):
                        seeAllBloc.add(GetAllPopularMoviesEvent());
                      case (MovieType.topRatedMovies):
                        seeAllBloc.add(GetAllTopRatedMoviesEvent());
                      case (MovieType.recommendedMovies):
                        seeAllBloc.add(GetAllRecommendedMoviesEvent(movieId: widget.movieId!));
                      case (MovieType.similarMovies):
                        seeAllBloc.add(GetAllSimilarMoviesEvent(movieId: widget.movieId!));
                    }
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
