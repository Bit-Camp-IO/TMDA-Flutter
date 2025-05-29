import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/constants/app_constants.dart';

class MovieDetailsPoster extends StatelessWidget {
  final String posterPath;
  final String errorPosterPath;
  final double height;

  const MovieDetailsPoster({
    super.key,
    required this.posterPath,
    required this.height,
    required this.errorPosterPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MovieDetailsClipper(),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: MediaQuery.sizeOf(context).width,
        curve: Curves.linear,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                posterPath.isNotEmpty
                    ? ApiConstants.imageUrl(posterPath)
                    : errorPosterPath,
                cacheManager: CacheManager(Config(
                  AppConstants.cacheFolder,
                  stalePeriod: const Duration(days: AppConstants.cacheDuration),
                ))),
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.3),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MovieDetailsClipper extends CustomClipper<Path> {
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
  bool shouldReclip(covariant MovieDetailsClipper oldClipper) {
    return true;
  }
}
