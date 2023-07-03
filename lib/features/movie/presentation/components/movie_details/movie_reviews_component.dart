import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/review_card.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

class MovieReviewsComponent extends StatelessWidget {
  const MovieReviewsComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        if (state.movieDetails.reviews.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.movieDetailsUserReviews,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieDetails.reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: ReviewCard(
                          reviewRating: state.movieDetails.reviews[index]
                              .movieReviewOwner.rating,
                          reviewAuthorName: state.movieDetails
                              .reviews[index].reviewAuthorName,
                          reviewContent: state
                              .movieDetails.reviews[index].reviewContent,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.movieDetailsUserReviews,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                      StringsManager.noReviews,
                      style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
