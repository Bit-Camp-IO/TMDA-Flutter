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
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
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
      create: (context) => getIt<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieId)),
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
    if (context.tabsRouter.activeIndex == 0) {
      context.read<MovieDetailsBloc>().add(GetMovieStatesEvent(movieId: widget.movieId));
    }
  }
  @override
  void didPopNext() {
    context.read<MovieDetailsBloc>().add(GetMovieStatesEvent(movieId: widget.movieId));
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
      body: SizedBox.expand(
        child: Stack(
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
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              buildWhen: (previous, current) =>
                  previous.movieDetailsState != current.movieDetailsState,
              builder: (context, state) {
                switch (state.movieDetailsState) {
                  case BlocState.initial || BlocState.loading:
                    return Center(
                      child: Lottie.asset(AssetsManager.neonLoading),
                    );
                  case BlocState.success:
                    return ListView(
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
                    );
                  case BlocState.failure:
                    return NoConnection(
                      onTap: () {
                        context.read<MovieDetailsBloc>().add(GetMovieDetailsEvent(widget.movieId));
                      },
                    );
                }
              },
            ),
            Positioned(
              top: 50,
              left: 20,
              child: CustomIconButton(
                onPressed: ()  {
                  AutoRouter.of(context).pop();
                },
                icon: Icons.arrow_back,
              ),
            ),
          ],
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
