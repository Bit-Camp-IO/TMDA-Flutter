import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dioClient => Dio();

  @lazySingleton
  FlutterSecureStorage get localStorage => const FlutterSecureStorage();
}

class $RegisterModule extends RegisterModule {}