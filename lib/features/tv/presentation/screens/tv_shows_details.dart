import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/color_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/custom_icon_button.dart';
import 'package:tmda/core/widgets/neon_light_painter.dart';
import 'package:tmda/features/auth/presentation/widgets/no_connection.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_body_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class TvDetailsScreen extends StatefulWidget with AutoRouteWrapper{
  const TvDetailsScreen(
      {super.key, @PathParam('tvShowId') required this.tvShowId});
  final int tvShowId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TvShowDetailsBloc>(),
      child: this,
    );
  }

  @override
  State<TvDetailsScreen> createState() => _TvDetailsScreenState();

}

class _TvDetailsScreenState extends State<TvDetailsScreen> {
  @override
  void initState() {
    context.read<TvShowDetailsBloc>().add(GetTvShowDetailsEvent(widget.tvShowId));
    
    super.initState();
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
              child: NeonLightPainter(color: ColorsManager.primaryColor),
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
            BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
              builder: (context, state) {
                switch (state.tvShowDetailsState) {
                  case BlocState.loading:
                    return Center(
                      child: Lottie.asset('assets/lottie/neon_loading.json'),
                    );
                  case BlocState.success:
                    return TvShowDetailsBodyComponent(tvShowId: widget.tvShowId);
                  case BlocState.failure:
                    return NoConnection(
                      onTap: () {
                        context
                            .read<TvShowDetailsBloc>()
                            .add(GetTvShowDetailsEvent(widget.tvShowId));
                      },
                    );
                }
              },
            ),
            Positioned(
              top: 50,
              left: 20,
              child: CustomIconButton(
                onPressed: () async {
                  await AutoRouter.of(context).pop();
                },
                icon: Icons.arrow_back,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
