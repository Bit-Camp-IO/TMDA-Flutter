import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvPoster extends StatelessWidget {
  const TvPoster({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
  });

  final String imagePath;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(const Radius.circular(10).w),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imagePath,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
