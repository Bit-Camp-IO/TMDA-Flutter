import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/features/person/presentation/bloc/person_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class PersonScreen extends StatelessWidget with AutoRouteWrapper {
  const PersonScreen(
      {super.key, @PathParam('personId') required this.personId});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PersonBloc>(),
      child: this,
    );
  }

  final int personId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Actor Screen $personId',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
                onPressed: () {
                  context.navigateTo(
                    TvTabRoutePage(
                      children: [
                        TvDetailsRoute(tvShowId: 1396),
                      ],
                    ),
                  );
                },
                child: Text('Go To Tv Screen'))
          ],
        ),
      ),
    );
  }
}
