import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/widget/custom_icon_button.dart';
import 'package:tmda/core/widget/neon_light_painter.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_cubit.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(
      {super.key, @PathParam('movieId') required this.movieId});
  final String movieId;
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
            
            BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
              buildWhen: (previous, current) => previous != current,
              bloc: BlocProvider.of<MovieDetailsCubit>(context)
                ..getMovieDetails(movieId),
              builder: (context, state) {
                switch (MovieDetailsState) {}
                if (state is MovieDetailsFailState) {
                  return const Text('Fail to load data');
                } else if (state is MovieDetailsLoadedState) {
                  return ListView(
                    children: [
                      Center(
                        child: Text(
                          state.movieDetails.title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
            Positioned(
              top: 30,
              left: 20,
              child: CustomIconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
