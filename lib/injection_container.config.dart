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
import 'package:tmda/features/account/domain/usecases/account_logout_usecase.dart'
    as _i76;
import 'package:tmda/features/account/domain/usecases/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i28;
import 'package:tmda/features/account/domain/usecases/add_or_remove_tv_show_from_watch_list_usecase.dart'
    as _i31;
import 'package:tmda/features/account/domain/usecases/get_account_details_usecase.dart'
    as _i33;
import 'package:tmda/features/account/domain/usecases/get_account_session_id_usecase.dart'
    as _i34;
import 'package:tmda/features/account/domain/usecases/get_all_movies_watchlist_usecase.dart'
    as _i36;
import 'package:tmda/features/account/domain/usecases/get_all_tv_shows_watchlist_usecase.dart'
    as _i46;
import 'package:tmda/features/account/domain/usecases/get_movie_show_watchlist_states_usecase.dart'
    as _i50;
import 'package:tmda/features/account/domain/usecases/get_movies_watchlist_usecase.dart'
    as _i51;
import 'package:tmda/features/account/domain/usecases/get_tv_show_watchlist_states_usecase.dart'
    as _i64;
import 'package:tmda/features/account/domain/usecases/get_tv_shows_watchlist_usecase.dart'
    as _i67;
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart'
    as _i79;
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart'
    as _i77;
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
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart' as _i32;
import 'package:tmda/features/auth/presentation/cubit/login_cubit.dart' as _i68;
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart'
    as _i15;
import 'package:tmda/features/movie/data/repositories/movies_repository_impl.dart'
    as _i17;
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart'
    as _i16;
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart'
    as _i52;
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart'
    as _i53;
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart'
    as _i54;
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart'
    as _i60;
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i29;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart'
    as _i48;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_id_usecase.dart'
    as _i58;
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart'
    as _i18;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_new_movies_usecase.dart'
    as _i37;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_popular_movies_usecase.dart'
    as _i38;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_recommended_movies_usecase.dart'
    as _i40;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_similar_movies_usecase.dart'
    as _i42;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_top_rated_movies_usecase.dart'
    as _i44;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_movie_states_usecase.dart'
    as _i49;
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart'
    as _i69;
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart'
    as _i70;
import 'package:tmda/features/movie/presentation/bloc/see_all_movies/see_all_movies_bloc.dart'
    as _i72;
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart' as _i19;
import 'package:tmda/features/tv/data/repositories/tv_repository_impl.dart'
    as _i21;
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart'
    as _i20;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_popular_tv_shows_usecase.dart'
    as _i39;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_recommended_tv_shows_usecase.dart'
    as _i41;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_similar_tv_shows_usecase.dart'
    as _i43;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_top_rated_tv_shows_usecase.dart'
    as _i45;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_tv_shows_airing_today_usecase.dart'
    as _i35;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_tv_show_states_usecase.dart'
    as _i63;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/add_or_remove_tv_from_watchlist_usecase.dart'
    as _i30;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_episode_video_usecase.dart'
    as _i47;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_recommended_tv_shows_usecase.dart'
    as _i56;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_season_episodes_usecase.dart'
    as _i57;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_similar_tv_shows_usecase.dart'
    as _i59;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart'
    as _i62;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart'
    as _i71;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/tv_get_session_key_usecase.dart'
    as _i73;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_popular_tv_shows.dart'
    as _i55;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_top_rated_tv_shows.dart'
    as _i61;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_this_week_usecase.dart'
    as _i65;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_today.dart'
    as _i66;
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows/see_all_tv_shows_bloc.dart'
    as _i78;
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart'
    as _i75;
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart'
    as _i74;
import 'package:tmda/register_module.dart' as _i80;

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
    gh.lazySingleton<_i28.RemoveMovieFromWatchListUseCase>(() =>
        _i28.RemoveMovieFromWatchListUseCase(
            gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i29.AddOrRemoveMovieFromWatchListUseCase>(() =>
        _i29.AddOrRemoveMovieFromWatchListUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i30.AddOrRemoveTvFromWatchListUseCase>(() =>
        _i30.AddOrRemoveTvFromWatchListUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i31.RemoveTvShowFromWatchListUseCase>(() =>
        _i31.RemoveTvShowFromWatchListUseCase(
            gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i32.AuthCubit>(() => _i32.AuthCubit(
          checkUserLoggedInUseCase: gh<_i14.CheckUserLoginSessionUseCase>(),
          userRegisterUseCase: gh<_i24.UserRegisterUseCase>(),
        ));
    gh.lazySingleton<_i33.GetAccountDetailsUseCase>(
        () => _i33.GetAccountDetailsUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i34.GetAccountSessionIdUseCase>(
        () => _i34.GetAccountSessionIdUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i35.GetAllAiringTodayTvShowsUseCase>(() =>
        _i35.GetAllAiringTodayTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i36.GetAllMoviesWatchListUseCase>(
        () => _i36.GetAllMoviesWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i37.GetAllNewMoviesUseCase>(() =>
        _i37.GetAllNewMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i38.GetAllPopularMoviesUseCase>(() =>
        _i38.GetAllPopularMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i39.GetAllPopularTvShowsUseCase>(() =>
        _i39.GetAllPopularTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i40.GetAllRecommendedMoviesUseCase>(() =>
        _i40.GetAllRecommendedMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i41.GetAllRecommendedTvShowsUseCase>(() =>
        _i41.GetAllRecommendedTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i42.GetAllSimilarMoviesUseCase>(() =>
        _i42.GetAllSimilarMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i43.GetAllSimilarTvShowsUseCase>(() =>
        _i43.GetAllSimilarTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i44.GetAllTopRatedMoviesUseCase>(() =>
        _i44.GetAllTopRatedMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i45.GetAllTopRatedTvShowsUseCase>(() =>
        _i45.GetAllTopRatedTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i46.GetAllTvShowsWatchListUseCase>(
        () => _i46.GetAllTvShowsWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i47.GetEpisodeVideoUseCase>(() =>
        _i47.GetEpisodeVideoUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i48.GetMovieDetailsUseCase>(() =>
        _i48.GetMovieDetailsUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i49.GetMovieStateUseCase>(() => _i49.GetMovieStateUseCase(
        moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i50.GetMovieWatchListStatesUseCase>(() =>
        _i50.GetMovieWatchListStatesUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i51.GetMoviesWatchListUseCase>(
        () => _i51.GetMoviesWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i52.GetNewMoviesUseCase>(() =>
        _i52.GetNewMoviesUseCase(movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i53.GetNowPlayingMoviesUseCase>(() =>
        _i53.GetNowPlayingMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i54.GetPopularMoviesUseCase>(() =>
        _i54.GetPopularMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i55.GetPopularTvShowsUseCase>(() =>
        _i55.GetPopularTvShowsUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i56.GetRecommendedTvShowsUseCase>(() =>
        _i56.GetRecommendedTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i57.GetSeasonsEpisodesUseCase>(() =>
        _i57.GetSeasonsEpisodesUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i58.GetSessionIdUseCase>(() => _i58.GetSessionIdUseCase(
        moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i59.GetSimilarTvShowsUseCase>(() =>
        _i59.GetSimilarTvShowsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i60.GetTopRatedMoviesUseCase>(() =>
        _i60.GetTopRatedMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i61.GetTopRatedTvShowsUseCase>(() =>
        _i61.GetTopRatedTvShowsUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i62.GetTvShowDetailsUseCase>(() =>
        _i62.GetTvShowDetailsUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i63.GetTvShowStateUseCase>(() =>
        _i63.GetTvShowStateUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i64.GetTvShowWatchListStatesUseCase>(() =>
        _i64.GetTvShowWatchListStatesUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i65.GetTvShowsAiringThisWeekUseCase>(() =>
        _i65.GetTvShowsAiringThisWeekUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i66.GetTvShowsAiringTodayUseCase>(() =>
        _i66.GetTvShowsAiringTodayUseCase(
            tvRepository: gh<_i20.TvShowsRepository>()));
    gh.lazySingleton<_i67.GetTvShowsWatchListUseCase>(
        () => _i67.GetTvShowsWatchListUseCase(gh<_i26.AccountRepository>()));
    gh.lazySingleton<_i68.LoginCubit>(() => _i68.LoginCubit(
          userRegisterUseCase: gh<_i24.UserRegisterUseCase>(),
          userForgetPasswordUseCase: gh<_i22.UserForgetPasswordUseCase>(),
          userLoginUseCase: gh<_i23.UserLoginUseCase>(),
        ));
    gh.factory<_i69.MovieDetailsBloc>(() => _i69.MovieDetailsBloc(
          getMovieDetailsUseCase: gh<_i48.GetMovieDetailsUseCase>(),
          getSessionIdUseCase: gh<_i58.GetSessionIdUseCase>(),
          playMovieTrailerUseCase: gh<_i18.PlayMovieVideoUseCase>(),
          addOrRemoveFromWatchListUseCase:
              gh<_i29.AddOrRemoveMovieFromWatchListUseCase>(),
        ));
    gh.factory<_i70.MoviesBloc>(() => _i70.MoviesBloc(
          getNowPlayingMoviesUseCase: gh<_i53.GetNowPlayingMoviesUseCase>(),
          getPopularMoviesUseCase: gh<_i54.GetPopularMoviesUseCase>(),
          getTopRatedMoviesUseCase: gh<_i60.GetTopRatedMoviesUseCase>(),
          getNewMoviesUseCase: gh<_i52.GetNewMoviesUseCase>(),
        ));
    gh.lazySingleton<_i71.PlayTvShowVideoUseCase>(() =>
        _i71.PlayTvShowVideoUseCase(
            tvShowsRepository: gh<_i20.TvShowsRepository>()));
    gh.factory<_i72.SeeAllMoviesBloc>(() => _i72.SeeAllMoviesBloc(
          gh<_i37.GetAllNewMoviesUseCase>(),
          gh<_i38.GetAllPopularMoviesUseCase>(),
          gh<_i44.GetAllTopRatedMoviesUseCase>(),
          gh<_i40.GetAllRecommendedMoviesUseCase>(),
          gh<_i42.GetAllSimilarMoviesUseCase>(),
          gh<_i29.AddOrRemoveMovieFromWatchListUseCase>(),
          gh<_i49.GetMovieStateUseCase>(),
          gh<_i58.GetSessionIdUseCase>(),
        ));
    gh.lazySingleton<_i73.TvGetSessionIdUseCase>(
        () => _i73.TvGetSessionIdUseCase(gh<_i20.TvShowsRepository>()));
    gh.factory<_i74.TvShowDetailsBloc>(() => _i74.TvShowDetailsBloc(
          getTvShowDetailsUseCase: gh<_i62.GetTvShowDetailsUseCase>(),
          getSimilarTvShowsUseCase: gh<_i59.GetSimilarTvShowsUseCase>(),
          getRecommendedTvShowsUseCase: gh<_i56.GetRecommendedTvShowsUseCase>(),
          getSeasonsEpisodesUseCase: gh<_i57.GetSeasonsEpisodesUseCase>(),
          getSessionKeyUseCase: gh<_i73.TvGetSessionIdUseCase>(),
          addOrRemoveTvFromWatchListUseCase:
              gh<_i30.AddOrRemoveTvFromWatchListUseCase>(),
          playTvShowVideoUseCase: gh<_i71.PlayTvShowVideoUseCase>(),
          getEpisodeVideoUseCase: gh<_i47.GetEpisodeVideoUseCase>(),
        ));
    gh.factory<_i75.TvShowsBloc>(() => _i75.TvShowsBloc(
          getTvShowsAiringTodayUseCase: gh<_i66.GetTvShowsAiringTodayUseCase>(),
          getTvShowsAiringThisWeekUseCase:
              gh<_i65.GetTvShowsAiringThisWeekUseCase>(),
          getPopularTvShowsUseCase: gh<_i55.GetPopularTvShowsUseCase>(),
          getTopRatedTvShowsUseCase: gh<_i61.GetTopRatedTvShowsUseCase>(),
        ));
    gh.lazySingleton<_i76.AccountLogoutUseCase>(
        () => _i76.AccountLogoutUseCase(gh<_i26.AccountRepository>()));
    gh.factory<_i77.AccountSeeAllBloc>(() => _i77.AccountSeeAllBloc(
          gh<_i34.GetAccountSessionIdUseCase>(),
          gh<_i36.GetAllMoviesWatchListUseCase>(),
          gh<_i46.GetAllTvShowsWatchListUseCase>(),
          gh<_i64.GetTvShowWatchListStatesUseCase>(),
          gh<_i31.RemoveTvShowFromWatchListUseCase>(),
          gh<_i50.GetMovieWatchListStatesUseCase>(),
          gh<_i28.RemoveMovieFromWatchListUseCase>(),
        ));
    gh.factory<_i78.SeeAllTvShowsBloc>(() => _i78.SeeAllTvShowsBloc(
          gh<_i73.TvGetSessionIdUseCase>(),
          gh<_i35.GetAllAiringTodayTvShowsUseCase>(),
          gh<_i39.GetAllPopularTvShowsUseCase>(),
          gh<_i45.GetAllTopRatedTvShowsUseCase>(),
          gh<_i41.GetAllRecommendedTvShowsUseCase>(),
          gh<_i43.GetAllSimilarTvShowsUseCase>(),
          gh<_i63.GetTvShowStateUseCase>(),
          gh<_i30.AddOrRemoveTvFromWatchListUseCase>(),
        ));
    gh.factory<_i79.AccountBloc>(() => _i79.AccountBloc(
          gh<_i33.GetAccountDetailsUseCase>(),
          gh<_i51.GetMoviesWatchListUseCase>(),
          gh<_i67.GetTvShowsWatchListUseCase>(),
          gh<_i76.AccountLogoutUseCase>(),
          gh<_i34.GetAccountSessionIdUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i80.RegisterModule {}
