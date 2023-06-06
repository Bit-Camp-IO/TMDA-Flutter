import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:tmda/config/router/app_router.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/api/dio_consumer.dart';
import 'package:tmda/core/api/dio_interceptor.dart';
import 'package:tmda/core/util/data_source/local_data_source.dart';
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart';
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart';
import 'package:tmda/features/auth/domain/usecases/check_user_login_session_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_forget_password_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart';
import 'package:tmda/features/movie/data/repositories/movies_repository_impl.dart';
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart';
import 'package:tmda/features/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:tmda/features/movie/domain/usecases/get_new_movies_usecase.dart';
import 'package:tmda/features/movie/presentation/bloc/dot_indicator/dot_indicator_cubit.dart';
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_cubit.dart';
import 'package:tmda/features/movie/presentation/bloc/movies_bloc/movies_bloc.dart';

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
    sl.registerLazySingleton<UserForgetPasswordUseCase>(
        () => UserForgetPasswordUseCase(authRepository: sl()));

    // Repository
    sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: sl()));

    // Data Source
    sl.registerLazySingleton<AuthDataSource>(
        () => AuthDataSourceImpl(apiConsumer: sl(), localDataSource: sl()));

    // ! Movie Feature

    // Cubits
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory<DotIndicatorCubit>(() => DotIndicatorCubit());
    sl.registerFactory<MovieDetailsCubit>(() => MovieDetailsCubit(sl()));
    // Use Cases
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(movieRepository: sl()));
    sl.registerLazySingleton<GetNewMoviesUseCase>(
        () => GetNewMoviesUseCase(movieRepository: sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(movieRepository: sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(movieRepository: sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(moviesRepository: sl()));
    // Movie Repository
    sl.registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(moviesDataSource: sl()));

    // Data Source
    sl.registerLazySingleton<MoviesDataSource>(
        () => MoviesDataSourceImpl(sl()));

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

    //! Auto Router

    sl.registerSingleton<AppRouter>(AppRouter());

    //! Shared Local Data Source
    sl.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(sl(), sl()));
    sl.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());
  }
}
