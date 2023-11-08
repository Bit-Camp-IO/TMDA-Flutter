import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/details_poster_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart';

class RecommendedTvShowsComponent extends StatelessWidget {
  const RecommendedTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.recommendedTvShows.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 250.ms)],
            child: Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: StringsManager.detailsRecommendedSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllTvShowsRoute(
                        tvShowId: state.tvShowDetails.id,
                        tvShowType: TvShowType.recommendedTvShows,
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tvShowDetails.recommendedTvShows.length,
                    itemBuilder: (context, index) {
                      final recommendedTvShow = state.tvShowDetails.recommendedTvShows[index];
                      return Padding(
                        padding: const EdgeInsets.only(left : 16.0).r,
                        child: DetailsPosterCard(
                          errorImagePath: AssetsManager.errorPoster,
                          imagePath: recommendedTvShow.posterPath,
                          title: recommendedTvShow.title,
                          rating: recommendedTvShow.voteAverage,
                          onTap: () {
                            context.pushRoute(
                              TvDetailsRoute(
                                tvShowId: recommendedTvShow.id,
                              ),
                            );
                          },
                        ),
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
                  title: StringsManager.detailsRecommendedSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    StringsManager.noRecommendedTvShows,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorsManager.primaryColor
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const SectionDivider(),
              ],
            ),
          );
        }
      },
    );
  }
}
