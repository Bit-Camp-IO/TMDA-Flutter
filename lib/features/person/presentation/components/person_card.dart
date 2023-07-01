import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';

class PersonPictureCard extends StatelessWidget {
  const PersonPictureCard({
    super.key,
    required this.imagePath,
    required this.errorImagePath,
    required this.name,
    required this.height,
  });

  final String imagePath;
  final String errorImagePath;
  final String name;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: ApiConstants.imageUrl(imagePath),
          imageBuilder: (context, imageProvider) {
            return AnimatedContainer(
              curve: Curves.linear,
              duration: const Duration(seconds: 1),
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60),
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(errorImagePath),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60),
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Text(name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28.sp),
          ),
        ),
      ],
    );
  }
}