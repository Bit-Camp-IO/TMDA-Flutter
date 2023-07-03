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
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';

class SimilarTvShowsComponent extends StatelessWidget {
  const SimilarTvShowsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.similarTvShows.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: StringsManager.detailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                  textButtonOnPressed: () {
                    context.pushRoute(
                      SeeAllTvShowsRoute(
                        tvShowId: state.tvShowDetails.id,
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
                          DetailsPosterCard(
                            errorImagePath: AssetsManager.noPoster,
                            imagePath: state.tvShowDetails.similarTvShows[index].posterPath,
                            title: state.tvShowDetails.similarTvShows[index].title,
                            rating: state.tvShowDetails.similarTvShows[index].voteAverage,
                            onTap: () {
                              context.pushRoute(
                                TvDetailsRoute(
                                  tvShowId: state.tvShowDetails.similarTvShows[index].id,
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
                  title: StringsManager.detailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: SizedBox(
                    height: 200.h,
                    child: Text(
                      StringsManager.noSimilarTvShows,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SectionDivider(),
              ],
            ),
          );
        }
      },
    );
  }
}
