import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TvDetailsPoster extends StatelessWidget {
  const TvDetailsPoster({
    super.key,
    required this.posterPath, required this.height,
  });
  final String posterPath;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MovieDetailsCLipper(),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
        width: MediaQuery.of(context).size.width,
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
    path0.moveTo(0,size.height*0.0023810);
    path0.lineTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.1281389,size.height*0.9059524,size.width*0.2073056,size.height*0.9023810);
    path0.cubicTo(size.width*0.2513889,size.height*0.8815476,size.width*0.7232778,size.height*0.8845238,size.width*0.7656389,size.height*0.9038810);
    path0.quadraticBezierTo(size.width*0.8489722,size.height*0.9038810,size.width,size.height*0.9976190);
    path0.lineTo(size.width,0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant MovieDetailsCLipper oldClipper) {
    return true;
  }
}