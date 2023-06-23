import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/auth/presentation/widgets/no_connection.dart';
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/now_playing_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/popular_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/top_rated_movies_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_main/new_movies_component.dart';

@RoutePage()
class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final ScrollController scrollController = ScrollController();
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
            BlocBuilder<MoviesBloc, MoviesState>(
              buildWhen: (previous, current) =>
                  previous.movieState != current.movieState,
              builder: (context, state) {
                switch (state.movieState) {
                  case BlocState.failure:
                    return NoConnection(
                      onTap: () {
                        context.read<MoviesBloc>()
                          ..add(GetNowPlayingMoviesEvent())
                          ..add(GetNewMoviesEvent())
                          ..add(GetPopularMoviesEvent())
                          ..add(GetTopRatedMoviesEvent());
                      },
                    );
                  case BlocState.success:
                    return ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        const NowPlayingMoviesComponent(),
                        const NewMoviesComponent(),
                        const PopularMoviesComponent(),
                        const TopRatedMoviesComponent(),
                        SizedBox(height: 60.h),
                      ],
                    );
                  case BlocState.loading:
                    return Center(
                      child: Lottie.asset('assets/lottie/neon_loading.json'),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
