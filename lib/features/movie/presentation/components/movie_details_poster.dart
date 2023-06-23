import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsPoster extends StatelessWidget {
  const MovieDetailsPoster({
    super.key,
    required this.posterPath,
    required this.height,
  });
  final String posterPath;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MovieDetailsCLipper(),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: MediaQuery.of(context).size.width,
        curve: Curves.linear,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              posterPath,
            ),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MovieDetailsCLipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0025000);
    path0.lineTo(0, size.height * 0.9200000);
    path0.quadraticBezierTo(size.width * 0.3781250, size.height * 1.0006250,
        size.width * 0.4975000, size.height * 0.9950000);
    path0.quadraticBezierTo(size.width * 0.6275000, size.height * 1.0006250,
        size.width, size.height * 0.9200000);
    path0.lineTo(size.width, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant MovieDetailsCLipper oldClipper) {
    return true;
  }
}
