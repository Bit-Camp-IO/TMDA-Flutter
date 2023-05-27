import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/dio_consumer.dart';
import 'package:tmda/core/api/dio_interceptor.dart';
import 'package:tmda/features/auth/data/datasources/local_data_source.dart';
import 'package:tmda/features/auth/data/datasources/remote_data_source.dart';
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tmda/features/auth/domain/entities/auth.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';
import 'package:tmda/features/auth/domain/usecases/check_user_loggedin_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/movie/presentation/cubit/movie_cubit.dart';

final serviceLocator = GetIt.instance;

class InjectionContainer {
  Future<void> init() async {

    //! Auth Feature 

    // Cubit

    serviceLocator.registerFactory<AuthCubit>(() => AuthCubit(serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator()));

    // UseCases

    serviceLocator.registerLazySingleton<UserLoginUseCase>(() => UserLoginUseCase(authRepository: serviceLocator()));
    serviceLocator.registerLazySingleton<UserRegisterUseCase>(() => UserRegisterUseCase(authRepository: serviceLocator()));
    serviceLocator.registerLazySingleton<CheckUserLoggedInUseCase>(() => CheckUserLoggedInUseCase(authRepository: serviceLocator()));
    // Repository

    serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDataSource: serviceLocator()));

    // Data Source

    serviceLocator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(apiConsumer: serviceLocator(),localDataSource: serviceLocator()));
    serviceLocator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

    // ! Movie Feature

    // Cubits

    serviceLocator.registerFactory<MovieCubit>(() => MovieCubit());
    
    //! Dio Injection
    // Dio Client
    serviceLocator.registerLazySingleton<Dio>(() => Dio());
    // Dio Consumer
    serviceLocator.registerLazySingleton<ApiConsumer>(
        () => DioApiConsumer(dioClient: serviceLocator()));
    // Dio Interceptor
    serviceLocator.registerLazySingleton<DioInterceptor>(() => DioInterceptor());

    // Dio Log Interceptor
    serviceLocator.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          error: true,
        ));



    Auth authData = await serviceLocator<RemoteDataSource>().checkUserLoggedIn();
    serviceLocator.registerLazySingleton<Auth>(() => authData);
  }
}
