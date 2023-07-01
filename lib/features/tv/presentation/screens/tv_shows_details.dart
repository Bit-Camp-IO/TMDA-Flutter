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
      create: (context) => getIt<TvShowDetailsBloc>()..add(GetTvShowDetailsEvent(tvShowId)),
      child: this,
    );
  }

  @override
  State<TvDetailsScreen> createState() => _TvDetailsScreenState();

}

class _TvDetailsScreenState extends State<TvDetailsScreen> with AutoRouteAware{
  AutoRouteObserver? _observer;
  TabsRouter? _tabsRouter;

  @override
  void didChangeDependencies() {
    _observer = RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer!.subscribe(this, context.routeData);
    }
    _tabsRouter = context.tabsRouter;
    _tabsRouter?.addListener(_tabListener);
    super.didChangeDependencies();
  }
  void _tabListener(){
    if (context.tabsRouter.activeIndex != 0) {
      context.read<TvShowDetailsBloc>().add(GetTvShowStatesEvent(tvShowId: widget.tvShowId));
    }
  }
  @override
  void didPopNext() {
    context.read<TvShowDetailsBloc>().add(GetTvShowStatesEvent(tvShowId: widget.tvShowId));
    super.didPopNext();
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
                    return const TvShowDetailsBodyComponent();
                  case BlocState.failure:
                    return NoConnection(
                      onTap: () {
                        context.read<TvShowDetailsBloc>()
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
  @override
  void dispose() {
    super.dispose();
    _observer!.unsubscribe(this);
    _tabsRouter?.removeListener(_tabListener);
  }
}
