import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/review_card.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';

class TvShowReviewsComponent extends StatelessWidget {
  const TvShowReviewsComponent({super.key, required this.tvShowId});
  final int tvShowId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.reviews.isNotEmpty) {
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
                    itemCount: state.tvShowDetails.reviews.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: ReviewCard(
                          reviewRating: state
                              .tvShowDetails.reviews[index].reviewOwner.rating,
                          reviewAuthorName:
                              state.tvShowDetails.reviews[index].authorName,
                          reviewContent:
                              state.tvShowDetails.reviews[index].reviewContent,
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
                  child: Text('No Reviews',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
