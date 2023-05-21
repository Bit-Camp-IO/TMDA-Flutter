import 'package:flutter/material.dart';
import 'package:tmda/core/api/api_consumer.dart';

import 'package:tmda/injection_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDA'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            sl<ApiConsumer>().get('movie/now_playing', queryParameters: {'language' : 'en-US'});
          },
          child: const Text('Get Data'),
        ),
      ),
    );
  }
}
