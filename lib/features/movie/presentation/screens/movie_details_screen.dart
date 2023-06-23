import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/auth/presentation/widgets/no_connection.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_cast_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_like_this_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_overview_component.dart';
import 'package:tmda/features/movie/presentation/components/movie_details/movie_reviews_component.dart';

@RoutePage()
class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    @PathParam('movieId') required this.movieId,
  });
  final int movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late ScrollController _scrollController;


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
              bloc: context.read<MovieDetailsBloc>()
                ..add(
                  GetMovieDetailsEvent(widget.movieId),
                ),
              buildWhen: (previous, current) =>
                  previous.movieDetailsState != current.movieDetailsState,
              builder: (context, state) {
                switch (state.movieDetailsState) {

                  case BlocState.loading:
                    return Center(
                      child: Lottie.asset('assets/lottie/neon_loading.json'),
                    );
                  case BlocState.success:
                    return ListView(
                      controller: _scrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        MovieOverviewComponent(movieId: widget.movieId, scrollController: _scrollController,),
                        MovieCastComponent(movieId: widget.movieId),
                        MoviesLikeThisComponent(movieId: widget.movieId),
                        MovieReviewsComponent(movieId: widget.movieId),
                        SizedBox(height: 70.h)
                      ],
                    );
                  case BlocState.failure:
                    return NoConnection(
                      onTap: () {
                        context
                            .read<MovieDetailsBloc>()
                            .add(GetMovieDetailsEvent(widget.movieId));
                      },
                    );
                }
              },
            ),
            Positioned(
              top: 50,
              left: 20,
              child: CustomIconButton(
                onPressed: () async {
                  await AutoRouter.of(context).pop();
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
    _scrollController.dispose();
    super.dispose();
  }
}
