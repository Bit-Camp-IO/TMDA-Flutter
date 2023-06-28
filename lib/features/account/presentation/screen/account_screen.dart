import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class AccountScreen extends StatefulWidget with AutoRouteWrapper{
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountBloc>(),
      child: this,
    );
  }
}

class _AccountScreenState extends State<AccountScreen> with AutoRouteAwareStateMixin<AccountScreen> {

  @override
  void didPopNext() {
    print('Next Page was poped');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Account Screen',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pushRoute(MovieDetailsRoute(movieId: 976573));
            },
            child: const Text('Go To Star Wars'),
          ),
        ],
      ),
    );
  }
}
