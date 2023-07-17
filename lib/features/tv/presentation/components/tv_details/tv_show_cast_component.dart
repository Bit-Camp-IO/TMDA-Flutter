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
import 'package:tmda/core/widgets/cast_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';

class TvShowCastComponent extends StatelessWidget {
  const TvShowCastComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
      builder: (context, state) {
        if (state.tvShowDetails.cast.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 250.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.castSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.tvShowDetails.cast.length,
                    itemBuilder: (context, index) {
                      final cast = state.tvShowDetails.cast[index];
                      return Padding(
                        padding: const EdgeInsets.only(left : 16.0).r,
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
                                  personScreenType:
                                      PersonScreenType.withTvShows,
                                ),
                              );
                            }
                          },
                          errorImagePath: AssetsManager.neonAvatar,
                          actorPicPath:cast.actorPicPath,
                          actorName:cast.actorName,
                          actorCharacterName:cast.movieCharacter,
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
          return Animate(
            effects: [FadeEffect(duration: 250.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.castSectionTitle,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    StringsManager.noTvShowCast,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: ColorsManager.primaryColor),
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
