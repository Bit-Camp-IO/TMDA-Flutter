import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/dio_consumer.dart';
import 'package:tmda/core/api/dio_interceptor.dart';

final sl = GetIt.instance;

class InjectionContainer {
  Future<void> init() async {
    //! Dio Injection
    // Dio Client
    sl.registerLazySingleton<Dio>(() => Dio());
    // Dio Consumer
    sl.registerLazySingleton<ApiConsumer>(
        () => DioApiConsumer(dioClient: sl()));
    // Dio Interceptor
    sl.registerLazySingleton<DioInterceptor>(() => DioInterceptor());

    // Dio Log Interceptor
    sl.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          error: true,
        ));
  }
}
