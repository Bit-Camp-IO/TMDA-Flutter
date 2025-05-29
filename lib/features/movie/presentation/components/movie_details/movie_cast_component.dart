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
import 'package:tmda/core/widgets/cast_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart';

class MovieCastComponent extends StatelessWidget {
  const MovieCastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state.movieDetails.cast.isNotEmpty) {
          return CustomFadeAnimation(
            duration: Duration(milliseconds: 150),
            child: Column(
              children: [
                SectionWidget(
                  title: context.tr.castSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movieDetails.cast.length,
                    itemBuilder: (context, index) {
                      final cast = state.movieDetails.cast[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0).r,
                        child: CastCard(
                          onTap: () {
                            final activeIndex = context.tabsRouter.activeIndex;
                            if (activeIndex == 2 || activeIndex == 3) {
                              context.pushRoute(
                                PersonRoute(
                                  personId: cast.actorId,
                                  personScreenType:
                                      PersonScreenType.withAllContent,
                                ),
                              );
                            } else {
                              context.pushRoute(
                                PersonRoute(
                                  personId: cast.actorId,
                                  personScreenType: PersonScreenType.withMovies,
                                ),
                              );
                            }
                          },
                          errorImagePath: AssetsManager.neonAvatar,
                          actorPicPath: cast.actorPicPath,
                          actorName: cast.actorName,
                          actorCharacterName: cast.movieCharacter,
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: SectionDivider(),
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
                  title: context.tr.detailsSimilarSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    context.tr.noMovieCast,
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
