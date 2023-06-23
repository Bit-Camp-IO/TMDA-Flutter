import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmda/config/router/app_router.dart';

@RoutePage()
class PersonScreen extends StatelessWidget {
  const PersonScreen(
      {super.key, @PathParam('personId') required this.personId});

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
                onPressed: () async{
                  await context.navigateTo(
                    const TvTabRoutePage(
                      children: [
                        TvShowsWrapperRoute(
                          children: [
                            TvShowRoute(),
                          ],
                        )
                      ],
                    ),
                  );
                  // context.navigateTo(

                  //           TvTabRoutePage(
                  //             children: [
                  //               TvShowsWrapperRoute(
                  //                 children: [
                  //                   TvShowRoute(

                  //               )
                  //                 ]
                  //               )

                  //             ]

                  //   )
                  // );
                },
                child: Text('Go To Tv Screen'))
          ],
        ),
      ),
    );
  }
}
