import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/dio_consumer.dart';
import 'package:tmda/injection_container.dart';

@module
abstract class RegisterModule {
  @injectable
  Dio get dioClient => Dio();

  @lazySingleton
  ApiConsumer get dioConsumer => DioApiConsumer(dioClient: getIt<Dio>());

  @lazySingleton
  FlutterSecureStorage get localStorage => const FlutterSecureStorage();
}

class $RegisterModule extends RegisterModule {}
