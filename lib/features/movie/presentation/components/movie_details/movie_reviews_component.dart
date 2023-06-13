import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widget/review_card.dart';
import 'package:tmda/core/widget/section_widget.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

class MovieReviewsComponent extends StatelessWidget {
  const MovieReviewsComponent({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      bloc: context.read<MovieDetailsBloc>()
        ..add(GetMovieReviewsEvent(movieId)),
      buildWhen: (previous, current) => previous.movieReviewsState != current.movieReviewsState,
      builder: (context, state) {
        switch (state.movieReviewsState) {
          case BlocState.loading:
            return SizedBox(
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          case BlocState.success:
            if (state.movieReviews.isNotEmpty) {
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
                        itemCount: state.movieReviews.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0).r,
                            child: ReviewCard(
                              reviewRating: state.movieReviews[index].movieReviewOwner.rating,
                              reviewAuthorName: state.movieReviews[index].movieReviewOwner.authorName,
                              reviewAuthorUserName: state.movieReviews[index].movieReviewOwner.authorUserName,
                              reviewContent: state.movieReviews[index].reviewContent,
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
          case BlocState.failure:
            return const Text('Load data Failed');
        }
      },
    );
  }
}
