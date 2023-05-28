import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/dio_consumer.dart';
import 'package:tmda/core/api/dio_interceptor.dart';
import 'package:tmda/core/util/data_source/local_data_source.dart';
import 'package:tmda/features/auth/data/datasources/remote_data_source.dart';
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';
import 'package:tmda/features/auth/domain/usecases/check_user_loging_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/movie/presentation/cubit/movie_cubit.dart';

final sl = GetIt.instance;

class InjectionContainer {
  Future<void> init() async {
    //! Auth Feature

    // Cubit

    sl.registerFactory<AuthCubit>(() => AuthCubit(sl(), sl(), sl(), sl()));

    // UseCases

    sl.registerLazySingleton<UserLoginUseCase>(
        () => UserLoginUseCase(authRepository: sl()));
    sl.registerLazySingleton<UserRegisterUseCase>(
        () => UserRegisterUseCase(authRepository: sl()));
    sl.registerLazySingleton<CheckUserLoginSessionUseCase>(
        () => CheckUserLoginSessionUseCase(authRepository: sl()));
    // Repository

    sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: sl()));

    // Data Source

    sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(apiConsumer: sl(), localDataSource: sl()));

    // ! Movie Feature

    // Cubits

    sl.registerFactory<MovieCubit>(() => MovieCubit());

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

    // Shared Local Data Source
    sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));
    sl.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());

    Auth authData = await sl<RemoteDataSource>().checkUserLoginSession();
    sl.registerLazySingleton<Auth>(() => authData);
  }
}
