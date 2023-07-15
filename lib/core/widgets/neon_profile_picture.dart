import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/constants/app_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';

class NeonProfilePicture extends StatelessWidget {
  const NeonProfilePicture({
    super.key, required this.imagePath, required this.errorImagePath,
  });
  final String imagePath;
  final String errorImagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            ColorsManager.secondaryColor,
            ColorsManager.primaryColor
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0).r,
        child: Container(
          width: 90.w,
          height: 90.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsManager.darkPrimary,
          ),
          child: CachedNetworkImage(
            cacheManager: CacheManager(
              Config(
                AppConstants.cacheFolder,
                stalePeriod: const Duration(days: AppConstants.cacheDuration),
              )
            ),
            imageUrl: imagePath.isNotEmpty ? ApiConstants.imageUrl(imagePath) : AssetsManager.neonAvatar,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: imageProvider
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                width: 90.w,
                height: 90.h,
                decoration: const BoxDecoration(
                  color: ColorsManager.darkPrimary,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(errorImagePath),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}