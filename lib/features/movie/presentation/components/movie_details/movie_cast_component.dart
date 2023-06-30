import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/core/widgets/cast_card.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/section_widget.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';

class MovieCastComponent extends StatelessWidget {
  const MovieCastComponent({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return Animate(
          effects: [FadeEffect(duration: 150.ms)],
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
                  itemCount: state.movieDetails.cast.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 16.w),
                        CastCard(
                          onTap: () {
                            context.pushRoute(
                              PersonRoute(
                                personId:
                                    state.movieDetails.cast[index].actorId,
                              ),
                            );
                          },
                          errorImagePath: AssetsManager.noPoster,
                          actorPicPath: state.movieDetails.cast[index].actorPicPath,
                          actorName: state.movieDetails.cast[index].actorName,
                          actorCharacterName: state.movieDetails.cast[index].movieCharacter,
                        ),
                      ],
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
      },
    );
  }
}
