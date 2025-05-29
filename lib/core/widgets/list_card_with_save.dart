import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/icons/solar_system_icons.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/tilted_image.dart';

class ListCardWithSave extends StatelessWidget {
  const ListCardWithSave({
    super.key,
    required this.title,
    required this.posterPath,
    required this.vote,
    required this.voteCount,
    required this.onTap,
    required this.genres,
    required this.releaseYear,
    required this.language,
    required this.isInWatchList,
    required this.onSaved,
    required this.errorImagePath,
  });

  final String title;
  final String posterPath;
  final dynamic vote;
  final int voteCount;
  final String releaseYear;
  final List genres;
  final String language;
  final void Function() onTap;
  final void Function() onSaved;
  final bool isInWatchList;
  final String errorImagePath;
  @override
  Widget build(BuildContext context) {
    return CustomFadeAnimation(
      duration: Duration(milliseconds: 400),
      child: InkWell(
        onTap: onTap,
        child: Transform(
          transform: Matrix4.skewX(-0.06),
          child: Container(
            width: 312.w,
            height: 210.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: Colors.black.withValues(alpha: 0.3),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 5).r,
                      child: TiltedImage(
                        errorImagePath: errorImagePath,
                        imagePath: posterPath,
                        width: 120.w,
                        height: 170.h,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            _buildCardInfo(
                              context: context,
                              genres: _buildGenres(
                                context: context,
                                genres: genres,
                              ),
                              language: language,
                              year: releaseYear,
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodySmall,
                          ),
                          SizedBox(height: 7.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorsManager.ratingIconColor,
                                size: 16.sp,
                              ),
                              Text(
                                vote.toString(),
                                style: context.textTheme.bodySmall!
                                    .copyWith(fontSize: 11.sp),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                context.tr.voteCount(voteCount.toString()),
                                style: context.textTheme.bodySmall!
                                    .copyWith(fontSize: 11.sp),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 15.h,
                  right: 15.w,
                  child: IconButton(
                    onPressed: onSaved,
                    icon: Icon(
                      isInWatchList
                          ? SolarSystemIcons.saved
                          : SolarSystemIcons.unsaved,
                      color: ColorsManager.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _buildGenres({required BuildContext context, required List genres}) {
    if (genres.isEmpty) {
      return context.tr.unknown;
    } else if (genres.length == 1) {
      return '${genres[0].name}';
    } else {
      return '${genres[0].name}/${genres[1].name}';
    }
  }

  String _buildCardInfo({
    required BuildContext context,
    required String year,
    required String genres,
    required String language,
  }) {
    if (year.isNotEmpty) {
      String parsedYear = year.substring(0, 4);
      return '$parsedYear  ‧ $genres ‧ $language';
    } else {
      return '${context.tr.unknown}  ‧ $genres  ‧ $language';
    }
  }
}
