import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/review_card.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart';

class MovieReviewsComponent extends StatelessWidget {
  const MovieReviewsComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state.movieDetails.reviews.isNotEmpty) {
          return CustomFadeAnimation(
            duration: Duration(milliseconds: 150),
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
                    itemCount: state.movieDetails.reviews.length,
                    itemBuilder: (context, index) {
                      final review = state.movieDetails.reviews[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: ReviewCard(
                          reviewRating: review.movieReviewOwner.rating,
                          reviewAuthorName: review.reviewAuthorName,
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
                    style: context.textTheme.bodyLarge,
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
