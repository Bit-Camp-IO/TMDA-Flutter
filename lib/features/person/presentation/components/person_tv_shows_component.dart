import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/animations/custom_fade_animation.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/extensions.dart';
import 'package:tmda/core/widgets/details_poster_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/person/presentation/cubit/person_cubit.dart';

class PersonTvShowsComponent extends StatelessWidget {
  const PersonTvShowsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      builder: (context, state) {
        if (state.personData.tvShows.isNotEmpty) {
          return CustomFadeAnimation(
            duration: Duration(milliseconds: 150),
            child: Column(
              children: [
                SectionWidget(
                  title: context.tr.tv,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.personData.tvShows.length,
                    itemBuilder: (context, index) {
                      final tvShow = state.personData.tvShows[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: DetailsPosterCard(
                          imagePath: tvShow.posterPath,
                          errorImagePath: AssetsManager.errorPoster,
                          title: tvShow.title,
                          rating: tvShow.voteAverage,
                          onTap: () {
                            context.pushRoute(
                              TvDetailsRoute(
                                tvShowId: tvShow.id,
                              ),
                            );
                          },
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
                  title: context.tr.tv,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    context.tr.noPersonTvShows,
                    style: context.textTheme.bodyLarge,
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
