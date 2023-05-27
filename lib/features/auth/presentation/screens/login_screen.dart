import 'package:flutter/material.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/injection_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19191B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF19191B),
        title: const Text(
          'TMDA',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
            child: ElevatedButton(
              onPressed: () {
                sl<ApiConsumer>().get('movie/now_playing',
                    queryParameters: {'language': 'en-US'});
              },
              child: const Text('Get Data'),
            ),
          ),
    );
  }
}
