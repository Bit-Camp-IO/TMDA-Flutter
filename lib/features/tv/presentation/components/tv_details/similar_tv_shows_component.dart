import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/details_poster_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/core/widgets/section_with_see_all.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart';

class SimilarTvShowsComponent extends StatelessWidget {
  const SimilarTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.similarTvShows.isNotEmpty) {
          return CustomFadeAnimation(
            child: Column(
              children: [
                SectionWidgetWithSeeAll(
                  title: context.tr.detailsSimilarSectionTitle,
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
                  width: MediaQuery.sizeOf(context).width,
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.tvShowDetails.similarTvShows.length,
                    itemBuilder: (context, index) {
                      final similarTvShow =
                          state.tvShowDetails.similarTvShows[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: DetailsPosterCard(
                          errorImagePath: AssetsManager.errorPoster,
                          imagePath: similarTvShow.posterPath,
                          title: similarTvShow.title,
                          rating: similarTvShow.voteAverage,
                          onTap: () {
                            context.pushRoute(
                              TvDetailsRoute(
                                tvShowId: similarTvShow.id,
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
          return CustomFadeAnimation(
            child: Column(
              children: [
                SectionWidget(
                  title: context.tr.detailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: SizedBox(
                    child: Text(
                      context.tr.noSimilarTvShows,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: ColorsManager.primaryColor,
                      ),
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
