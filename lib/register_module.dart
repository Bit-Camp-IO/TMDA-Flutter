import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/authenticated_interceptor.dart';
import 'package:tmda/core/api/dio_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/injection_container.dart';

@module
abstract class RegisterModule {
  @injectable
  Dio get dioClient => Dio();

  @Named(ApiConstants.unAuthenticatedConsumer)
  @lazySingleton
  ApiConsumer get mainApiConsumer => DioApiConsumer(
    dioClient: getIt<Dio>(),
  );
  @Named(ApiConstants.authenticatedConsumer)
  @lazySingleton
  ApiConsumer get authenticatedApiConsumer => DioApiConsumer(
    dioClient: getIt<Dio>(),
    interceptor: getIt<AuthenticatedInterceptor>(),
  );

  @lazySingleton
  FlutterSecureStorage get localStorage => const FlutterSecureStorage();
}

class $RegisterModule extends RegisterModule {}