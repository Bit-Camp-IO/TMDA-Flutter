import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widget/cast_card.dart';
import 'package:tmda/core/widget/section_divider.dart';
import 'package:tmda/core/widget/section_widget.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

class MovieCastComponent extends StatelessWidget {
  const MovieCastComponent({
    super.key,
    required this.movieId,
  });
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      bloc: context.read<MovieDetailsBloc>()..add(GetMovieCastEvent(movieId)),
      buildWhen: (previous, current) =>
          previous.movieCastState != current.movieCastState,
      builder: (context, state) {
        switch (state.movieCastState) {
          case BlocState.loading:
            return const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );

          case BlocState.success:
            return Animate(
              effects: [FadeEffect(duration: 150.ms)],
              child: Column(
                children: [
                  const SectionWidget(
                    title: StringsManager.movieDetailsCastSection,
                    color: ColorsManager.primaryColor,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: state.movieCast.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0).r,
                              child: CastCard(
                                actorPicPath:
                                    state.movieCast[index].actorPicPath.isNotEmpty
                                    ? ApiConstants.imageUrl(state.movieCast[index].actorPicPath)
                                        : AssetsManager.actorNoPic,
                                actorName: state.movieCast[index].actorName,
                                actorCharacterName: state.movieCast[index].movieCharacter,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SectionDivider(),
                ],
              ),
            );

          case BlocState.failure:
            return const Text('Load data Failed');
        }
      },
    );
  }
}
