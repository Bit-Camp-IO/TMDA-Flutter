import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/features/person/presentation/bloc/person_bloc.dart';
import 'package:tmda/injection_container.dart';

@RoutePage()
class PersonWrapperScreen extends StatelessWidget {
  const PersonWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<PersonBloc>()
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
