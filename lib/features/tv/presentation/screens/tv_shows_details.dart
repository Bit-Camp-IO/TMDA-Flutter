import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_body_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class TvDetailsScreen extends StatefulWidget implements AutoRouteWrapper{
  const TvDetailsScreen({super.key, required this.tvShowId});
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

class _TvDetailsScreenState extends State<TvDetailsScreen> with AutoRouteAwareStateMixin<TvDetailsScreen>{
  TabsRouter? _tabsRouter;

  @override
  void didChangeDependencies() {
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
      body: NeonLightBackGround(
        isBackButtonActive: true,
        child: BlocBuilder<TvShowDetailsBloc, TvShowDetailsState>(
          builder: (context, state) {
            switch (state.tvShowDetailsState) {
              case BlocState.initial || BlocState.loading:
                return Center(
                  child: Lottie.asset(AssetsManager.neonLoading),
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
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _tabsRouter?.removeListener(_tabListener);
  }
}
