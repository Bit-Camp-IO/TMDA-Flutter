import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
  final String movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CurveClipper(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.neonBackground),
              fit: BoxFit.cover,
      
            ),
          ),
          
          child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
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
                    )),
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
        ),
      ),
    );
  }
  
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}