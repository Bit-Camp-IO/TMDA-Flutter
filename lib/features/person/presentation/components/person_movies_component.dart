import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/details_poster_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/person/presentation/bloc/person_cubit.dart';

class PersonMoviesComponent extends StatelessWidget {
  const PersonMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(
      builder: (context, state) {
        if (state.personData.movies.isNotEmpty) {
          return Animate(
            effects: [FadeEffect(duration: 150.ms)],
            child: Column(
              children: [
                const SectionWidget(
                  title: StringsManager.movie,
                  color: ColorsManager.primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.personData.movies.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 16.w),
                          DetailsPosterCard(
                            imagePath: state.personData.movies[index].posterPath,
                            errorImagePath: AssetsManager.noPoster,
                            title: state.personData.movies[index].title,
                            rating: state.personData.movies[index].voteAverage,
                            onTap: () {
                              context.pushRoute(
                                MovieDetailsRoute(
                                  movieId: state.personData.movies[index].id,
                                ),
                              );
                            },
                          ),
                        ],
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
                  title: StringsManager.movie,
                  color: ColorsManager.primaryColor,
                ),
                Center(
                  child: Text(
                    StringsManager.noPersonMovies,
                    style: Theme.of(context).textTheme.bodyLarge,
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
