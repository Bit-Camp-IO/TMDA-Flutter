import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class AccountSeeAllScreen extends StatefulWidget with AutoRouteWrapper{
  const AccountSeeAllScreen({super.key, @PathParam(':accountSeeAllType') required this.seeAllType, this.movieId, this.tvShowId});
  final dynamic seeAllType;
  final int? movieId;
  final int? tvShowId;

  @override
  State<AccountSeeAllScreen> createState() => _AccountSeeAllScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountSeeAllBloc>(),
      child: this,
    );
  }
}

class _AccountSeeAllScreenState extends State<AccountSeeAllScreen>{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
