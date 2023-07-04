import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/core/widgets/section_divider.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/person/presentation/components/person_details_component.dart';
import 'package:tmda/features/person/presentation/components/person_movies_component.dart';
import 'package:tmda/features/person/presentation/components/person_tv_shows_component.dart';
import 'package:tmda/features/person/presentation/cubit/person_cubit.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class PersonScreen extends StatefulWidget with AutoRouteWrapper {
  final int personId;
  final PersonScreenType personScreenType;

  const PersonScreen(
      {super.key, required this.personId, required this.personScreenType});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PersonCubit>()..getPersonDetails(personId),
      child: this,
    );
  }

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  late ScrollController _scrollController;

  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const Positioned(
              top: 30,
              left: 20,
              child: NeonLightPainter(
                color: ColorsManager.primaryColor,
              ),
            ),
            const Positioned(
              bottom: 350,
              right: 0,
              child: NeonLightPainter(color: ColorsManager.secondaryColor),
            ),
            const Positioned(
              bottom: 10,
              left: 10,
              child: NeonLightPainter(color: ColorsManager.primaryColor),
            ),
            BlocBuilder<PersonCubit, PersonState>(
              buildWhen: (previous, current) =>
                  previous.personDataState != current.personDataState,
              builder: (context, state) {
                switch (state.personDataState) {
                  case BlocState.initial || BlocState.loading:
                    return Center(
                      child: Lottie.asset(AssetsManager.neonLoading),
                    );
                  case BlocState.success:
                    return ListView(
                      controller: _scrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        const PersonOverviewComponent(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0).r,
                          child: const SectionDivider(),
                        ),
                        Builder(
                          builder: (context) {
                            if (widget.personScreenType ==
                                PersonScreenType.withMovies) {
                              return const PersonMoviesComponent();
                            } else if (widget.personScreenType ==
                                PersonScreenType.withTvShows) {
                              return const PersonTvShowsComponent();
                            } else {
                              return Column(
                                children: [
                                  const PersonMoviesComponent(),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0).r,
                                    child: const SectionDivider(),
                                  ),
                                  const PersonTvShowsComponent(),
                                ],
                              );
                            }
                          },
                        ),
                        SizedBox(height: 70.h)
                      ],
                    );
                  case BlocState.failure:
                    return NoConnection(
                      onTap: () {
                        context
                            .read<PersonCubit>()
                            .getPersonDetails(widget.personId);
                      },
                    );
                }
              },
            ),
            Positioned(
              top: 40,
              left: 20,
              child: CustomIconButton(
                onPressed: () {
                  context.popRoute();
                },
                icon: Icons.arrow_back,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
