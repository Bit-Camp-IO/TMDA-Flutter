import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_details/tv_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_details_poster_card.dart';

class SimilarTvShowsComponent extends StatelessWidget {
  const SimilarTvShowsComponent({
    super.key,
    required this.tvShowId,
  });
  final int tvShowId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.similarTvShows.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: StringsManager.movieDetailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    AutoRouter.of(context).push(
                      SeeAllTvShowsRoute(
                        tvShowId: tvShowId,
                        tvShowType: TvShowType.similarTvShows,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tvShowDetails.similarTvShows.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 20.w),
                          TvDetailsPosterCard(
                            imagePath: state.tvShowDetails.similarTvShows[index]
                                    .posterPath.isNotEmpty
                                ? ApiConstants.imageUrl(state.tvShowDetails
                                    .similarTvShows[index].posterPath)
                                : AssetsManager.noPoster,
                            title:
                                state.tvShowDetails.similarTvShows[index].title,
                            rating: state
                                .tvShowDetails.similarTvShows[index].voteAverage,
                            onTap: () {
                              AutoRouter.of(context).push(
                                TvShowDetailsWrapperRoute(
                                  children: [
                                    TvDetailsRoute(
                                      tvShowId: state.tvShowDetails
                                          .similarTvShows[index].tvShowId,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                const SectionDivider(),
              ],
            ),
          );
        } else {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.movieDetailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    'We couldn\'t find movies like this.',
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
