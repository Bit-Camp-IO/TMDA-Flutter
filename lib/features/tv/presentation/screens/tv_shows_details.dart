import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tmda/core/util/assets_manager.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/core/widgets/neon_light_background.dart';
import 'package:tmda/core/widgets/no_connection.dart';
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart';
import 'package:tmda/features/tv/presentation/components/tv_details/tv_show_body_component.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class TvDetailsScreen extends StatelessWidget implements AutoRouteWrapper{
  const TvDetailsScreen({super.key, required this.tvShowId});
  final int tvShowId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TvShowDetailsCubit>()..getTvShowDetails(tvShowId: tvShowId),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeonLightBackGround(
        isBackButtonActive: true,
        child: BlocBuilder<TvShowDetailsCubit, TvShowDetailsState>(
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
                    context.read<TvShowDetailsCubit>().getTvShowDetails(tvShowId: tvShowId);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
