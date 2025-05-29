import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/review_card.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart';

class TvShowReviewsComponent extends StatelessWidget {
  const TvShowReviewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.reviews.isNotEmpty) {
          return CustomFadeAnimation(
            child: Column(
              children: [
                SectionWidget(
                  title: context.tr.movieDetailsUserReviews,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tvShowDetails.reviews.length,
                    itemBuilder: (context, index) {
                      final review = state.tvShowDetails.reviews[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: ReviewCard(
                          reviewRating: review.reviewOwner.rating,
                          reviewAuthorName: review.authorName,
                          reviewContent: review.reviewContent,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return CustomFadeAnimation(
            duration: Duration(milliseconds: 150),
            child: Column(
              children: [
                SectionWidget(
                  title: context.tr.movieDetailsUserReviews,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    context.tr.noReviews,
                    style: context.textTheme.bodyLarge!
                        .copyWith(color: ColorsManager.primaryColor),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        }
      },
    );
  }
}
