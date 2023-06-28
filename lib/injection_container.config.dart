// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tmda/config/router/app_router.dart' as _i3;
import 'package:tmda/core/api/api_consumer.dart' as _i9;
import 'package:tmda/core/api/dio_consumer.dart' as _i10;
import 'package:tmda/core/api/dio_interceptor.dart' as _i5;
import 'package:tmda/core/api/dio_logger.dart' as _i6;
import 'package:tmda/core/util/shared_data_source/local_data_source.dart'
    as _i8;
import 'package:tmda/features/account/data/datasources/account_data_source.dart'
    as _i25;
import 'package:tmda/features/account/data/repositories/account_repository_impl.dart'
    as _i27;
import 'package:tmda/features/account/domain/repositories/account_repository.dart'
    as _i26;
import 'package:tmda/features/account/domain/usecases/add_or_remove_from_watch_list_usecase.dart'
    as _i28;
import 'package:tmda/features/account/domain/usecases/get_account_details_usecase.dart'
    as _i34;
import 'package:tmda/features/account/domain/usecases/get_account_movies_watchlist_usecase.dart'
    as _i35;
import 'package:tmda/features/account/domain/usecases/get_account_session_id_usecase.dart'
    as _i36;
import 'package:tmda/features/account/domain/usecases/get_account_tv_shows_watchlist_usecase.dart'
    as _i37;
import 'package:tmda/features/account/domain/usecases/get_all_account_movies_watchlist_usecase.dart'
    as _i32;
import 'package:tmda/features/account/domain/usecases/get_all_tv_shows_watchlist_usecase.dart'
    as _i33;
import 'package:tmda/features/account/domain/usecases/get_watchlist_states_usecase.dart'
    as _i65;
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart'
    as _i11;
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart'
    as _i13;
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart'
    as _i12;
import 'package:tmda/features/auth/domain/usecases/check_user_login_session_usecase.dart'
    as _i14;
import 'package:tmda/features/auth/domain/usecases/user_forget_password_usecase.dart'
    as _i22;
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart'
    as _i23;
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart'
    as _i24;
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart' as _i31;
import 'package:tmda/features/auth/presentation/cubit/login_cubit.dart' as _i66;
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart'
    as _i15;
import 'package:tmda/features/movie/data/repositories/movies_repository_impl.dart'
    as _i17;
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart'
    as _i16;
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart'
    as _i51;
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart'
    as _i52;
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart'
    as _i53;
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart'
    as _i59;
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i29;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart'
    as _i49;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_id_usecase.dart'
    as _i57;
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart'
    as _i18;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_new_movies_usecase.dart'
    as _i39;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_popular_movies_usecase.dart'
    as _i40;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_recommended_movies_usecase.dart'
    as _i42;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_similar_movies_usecase.dart'
    as _i44;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_top_rated_movies_usecase.dart'
    as _i46;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_movie_states_usecase.dart'
    as _i50;
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart'
    as _i67;
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart'
    as _i68;
import 'package:tmda/features/movie/presentation/bloc/see_all_movies/see_all_movies_bloc.dart'
    as _i70;
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart' as _i19;
import 'package:tmda/features/tv/data/repositories/tv_repository_impl.dart'
    as _i21;
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart'
    as _i20;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_popular_tv_shows_usecase.dart'
    as _i41;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_recommended_tv_shows_usecase.dart'
    as _i43;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_similar_tv_shows_usecase.dart'
    as _i45;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_top_rated_tv_shows_usecase.dart'
    as _i47;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_tv_shows_airing_today_usecase.dart'
    as _i38;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_tv_show_states_usecase.dart'
    as _i62;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/add_or_remove_tv_from_watchlist_usecase.dart'
    as _i30;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_episode_video_usecase.dart'
    as _i48;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_recommended_tv_shows_usecase.dart'
    as _i55;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_season_episodes_usecase.dart'
    as _i56;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_similar_tv_shows_usecase.dart'
    as _i58;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart'
    as _i61;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart'
    as _i69;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/tv_get_session_key_usecase.dart'
    as _i71;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_popular_tv_shows.dart'
    as _i54;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_top_rated_tv_shows.dart'
    as _i60;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_this_week_usecase.dart'
    as _i63;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_today.dart'
    as _i64;
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows/see_all_tv_shows_bloc.dart'
    as _i74;
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart'
    as _i73;
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart'
    as _i72;
import 'package:tmda/register_module.dart' as _i75;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    gh.lazySingleton<_i4.Dio>(() => registerModule.dioClient);
    gh.lazySingleton<_i5.DioInterceptor>(() => _i5.DioInterceptor());
    gh.lazySingleton<_i6.DioLogInterceptor>(() => _i6.DioLogInterceptor());
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => registerModule.localStorage);
    gh.lazySingleton<_i8.LocalDataSource>(() =>
        _i8.LocalDataSourceImpl(secureStorage: gh<_i7.FlutterSecureStorage>()));
    gh.lazySingleton<_i9.ApiConsumer>(
        () => _i10.DioApiConsumer(dioClient: gh<_i4.Dio>()));
    gh.lazySingleton<_i11.AuthDataSource>(() => _i11.AuthDataSourceImpl(
          apiConsumer: gh<_i9.ApiConsumer>(),
          localDataSource: gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i12.AuthRepository>(() =>
        _i13.AuthRepositoryImpl(remoteDataSource: gh<_i11.AuthDataSource>()));
    gh.lazySingleton<_i14.CheckUserLoginSessionUseCase>(() =>
        _i14.CheckUserLoginSessionUseCase(
            authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i15.MoviesDataSource>(
        () => _i15.MoviesDataSourceImpl(gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i16.MoviesRepository>(() => _i17.MoviesRepositoryImpl(
          moviesDataSource: gh<_i15.MoviesDataSource>(),
          localDataSource: gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i18.PlayMovieVideoUseCase>(() =>
        _i18.PlayMovieVideoUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i19.TvDataSource>(
        () => _i19.TvDataSourceImpl(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i20.TvShowsRepository>(() => _i21.TvRepositoryImpl(
          tvDataSource: gh<_i19.TvDataSource>(),
          localDataSource: gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i22.UserForgetPasswordUseCase>(() =>
        _i22.UserForgetPasswordUseCase(
            authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i23.UserLoginUseCase>(
        () => _i23.UserLoginUseCase(authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i24.UserRegisterUseCase>(() =>
        _i24.UserRegisterUseCase(authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i25.AccountDataSource>(
        () => _i25.AccountDataSourceImpl(gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i26.AccountRepository>(() => _i27.AccountRepositoryImpl(
          gh<_i25.AccountDataSource>(),
          gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i28.AddOrRemoveFromWatchListUseCase>(() =>
        _i28.AddOrRemoveFromWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i29.AddOrRemoveMovieFromWatchListUseCase>(() =>
        _i29.AddOrRemoveMovieFromWatchListUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i30.AddOrRemoveTvFromWatchListUseCase>(() =>
        _i30.AddOrRemoveTvFromWatchListUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i31.AuthCubit>(() => _i31.AuthCubit(
          checkUserLoggedInUseCase: gh<_i14.CheckUserLoginSessionUseCase>(),
          userRegisterUseCase: gh<_i24.UserRegisterUseCase>(),
        ));
    gh.lazySingleton<_i32.GetAccountAllMoviesWatchListUseCase>(() =>
        _i32.GetAccountAllMoviesWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i33.GetAccountAllTvShowsWatchListUseCase>(() =>
        _i33.GetAccountAllTvShowsWatchListUseCase(
            gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i34.GetAccountDetailsUseCase>(
        () => _i34.GetAccountDetailsUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i35.GetAccountMoviesWatchListUseCase>(() =>
        _i35.GetAccountMoviesWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i36.GetAccountSessionIdUseCase>(
        () => _i36.GetAccountSessionIdUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i37.GetAccountTvShowsWatchListUseCase>(() =>
        _i37.GetAccountTvShowsWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i38.GetAllAiringTodayTvShowsUseCase>(() =>
        _i38.GetAllAiringTodayTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i39.GetAllNewMoviesUseCase>(() =>
        _i39.GetAllNewMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i40.GetAllPopularMoviesUseCase>(() =>
        _i40.GetAllPopularMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i41.GetAllPopularTvShowsUseCase>(() =>
        _i41.GetAllPopularTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i42.GetAllRecommendedMoviesUseCase>(() =>
        _i42.GetAllRecommendedMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i43.GetAllRecommendedTvShowsUseCase>(() =>
        _i43.GetAllRecommendedTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i44.GetAllSimilarMoviesUseCase>(() =>
        _i44.GetAllSimilarMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i45.GetAllSimilarTvShowsUseCase>(() =>
        _i45.GetAllSimilarTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i46.GetAllTopRatedMoviesUseCase>(() =>
        _i46.GetAllTopRatedMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i47.GetAllTopRatedTvShowsUseCase>(() =>
        _i47.GetAllTopRatedTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i48.GetEpisodeVideoUseCase>(() =>
        _i48.GetEpisodeVideoUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i49.GetMovieDetailsUseCase>(() =>
        _i49.GetMovieDetailsUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i50.GetMovieStateUseCase>(() => _i50.GetMovieStateUseCase(
        moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i51.GetNewMoviesUseCase>(() =>
        _i51.GetNewMoviesUseCase(movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i52.GetNowPlayingMoviesUseCase>(() =>
        _i52.GetNowPlayingMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i53.GetPopularMoviesUseCase>(() =>
        _i53.GetPopularMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i54.GetPopularTvShowsUseCase>(() =>
        _i54.GetPopularTvShowsUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i55.GetRecommendedTvShowsUseCase>(() =>
        _i55.GetRecommendedTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i56.GetSeasonsEpisodesUseCase>(() =>
        _i56.GetSeasonsEpisodesUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i57.GetSessionIdUseCase>(() => _i57.GetSessionIdUseCase(
        moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i58.GetSimilarTvShowsUseCase>(() =>
        _i58.GetSimilarTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i59.GetTopRatedMoviesUseCase>(() =>
        _i59.GetTopRatedMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i60.GetTopRatedTvShowsUseCase>(() =>
        _i60.GetTopRatedTvShowsUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i61.GetTvShowDetailsUseCase>(() =>
        _i61.GetTvShowDetailsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i62.GetTvShowStateUseCase>(() =>
        _i62.GetTvShowStateUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i63.GetTvShowsAiringThisWeekUseCase>(() =>
        _i63.GetTvShowsAiringThisWeekUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i64.GetTvShowsAiringTodayUseCase>(() =>
        _i64.GetTvShowsAiringTodayUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i65.GetWatchListStatesUseCase>(
        () => _i65.GetWatchListStatesUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i66.LoginCubit>(() => _i66.LoginCubit(
          userRegisterUseCase: gh<_i24.UserRegisterUseCase>(),
          userForgetPasswordUseCase: gh<_i22.UserForgetPasswordUseCase>(),
          userLoginUseCase: gh<_i23.UserLoginUseCase>(),
        ));
    gh.factory<_i67.MovieDetailsBloc>(() => _i67.MovieDetailsBloc(
          getMovieDetailsUseCase: gh<_i49.GetMovieDetailsUseCase>(),
          getSessionIdUseCase: gh<_i57.GetSessionIdUseCase>(),
          playMovieTrailerUseCase: gh<_i18.PlayMovieVideoUseCase>(),
          addOrRemoveFromWatchListUseCase:
              gh<_i29.AddOrRemoveMovieFromWatchListUseCase>(),
        ));
    gh.factory<_i68.MoviesBloc>(() => _i68.MoviesBloc(
          getNowPlayingMoviesUseCase: gh<_i52.GetNowPlayingMoviesUseCase>(),
          getPopularMoviesUseCase: gh<_i53.GetPopularMoviesUseCase>(),
          getTopRatedMoviesUseCase: gh<_i59.GetTopRatedMoviesUseCase>(),
          getNewMoviesUseCase: gh<_i51.GetNewMoviesUseCase>(),
        ));
    gh.lazySingleton<_i69.PlayTvShowVideoUseCase>(() =>
        _i69.PlayTvShowVideoUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.factory<_i70.SeeAllMoviesBloc>(() => _i70.SeeAllMoviesBloc(
          gh<_i39.GetAllNewMoviesUseCase>(),
          gh<_i40.GetAllPopularMoviesUseCase>(),
          gh<_i46.GetAllTopRatedMoviesUseCase>(),
          gh<_i42.GetAllRecommendedMoviesUseCase>(),
          gh<_i44.GetAllSimilarMoviesUseCase>(),
          gh<_i29.AddOrRemoveMovieFromWatchListUseCase>(),
          gh<_i50.GetMovieStateUseCase>(),
          gh<_i57.GetSessionIdUseCase>(),
        ));
    gh.lazySingleton<_i71.TvGetSessionIdUseCase>(
        () => _i71.TvGetSessionIdUseCase(gh<_i20.TvShowsRepository>()));
    gh.factory<_i72.TvShowDetailsBloc>(() => _i72.TvShowDetailsBloc(
          getTvShowDetailsUseCase: gh<_i61.GetTvShowDetailsUseCase>(),
          getSimilarTvShowsUseCase: gh<_i58.GetSimilarTvShowsUseCase>(),
          getRecommendedTvShowsUseCase: gh<_i55.GetRecommendedTvShowsUseCase>(),
          getSeasonsEpisodesUseCase: gh<_i56.GetSeasonsEpisodesUseCase>(),
          getSessionKeyUseCase: gh<_i71.TvGetSessionIdUseCase>(),
          addOrRemoveTvFromWatchListUseCase:
              gh<_i30.AddOrRemoveTvFromWatchListUseCase>(),
          playTvShowVideoUseCase: gh<_i69.PlayTvShowVideoUseCase>(),
          getEpisodeVideoUseCase: gh<_i48.GetEpisodeVideoUseCase>(),
        ));
    gh.factory<_i73.TvShowsBloc>(() => _i73.TvShowsBloc(
          getTvShowsAiringTodayUseCase: gh<_i64.GetTvShowsAiringTodayUseCase>(),
          getTvShowsAiringThisWeekUseCase:
              gh<_i63.GetTvShowsAiringThisWeekUseCase>(),
          getPopularTvShowsUseCase: gh<_i54.GetPopularTvShowsUseCase>(),
          getTopRatedTvShowsUseCase: gh<_i60.GetTopRatedTvShowsUseCase>(),
        ));
    gh.factory<_i74.SeeAllTvShowsBloc>(() => _i74.SeeAllTvShowsBloc(
          gh<_i71.TvGetSessionIdUseCase>(),
          gh<_i38.GetAllAiringTodayTvShowsUseCase>(),
          gh<_i41.GetAllPopularTvShowsUseCase>(),
          gh<_i47.GetAllTopRatedTvShowsUseCase>(),
          gh<_i43.GetAllRecommendedTvShowsUseCase>(),
          gh<_i45.GetAllSimilarTvShowsUseCase>(),
          gh<_i62.GetTvShowStateUseCase>(),
          gh<_i30.AddOrRemoveTvFromWatchListUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i75.RegisterModule {}
