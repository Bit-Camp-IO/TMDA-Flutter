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
    as _i31;
import 'package:tmda/features/account/data/repositories/account_repository_impl.dart'
    as _i33;
import 'package:tmda/features/account/domain/repositories/account_repository.dart'
    as _i32;
import 'package:tmda/features/account/domain/usecases/account_logout_usecase.dart'
    as _i91;
import 'package:tmda/features/account/domain/usecases/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i82;
import 'package:tmda/features/account/domain/usecases/add_or_remove_tv_show_from_watch_list_usecase.dart'
    as _i83;
import 'package:tmda/features/account/domain/usecases/get_account_details_usecase.dart'
    as _i40;
import 'package:tmda/features/account/domain/usecases/get_account_session_id_usecase.dart'
    as _i41;
import 'package:tmda/features/account/domain/usecases/get_all_movies_watchlist_usecase.dart'
    as _i43;
import 'package:tmda/features/account/domain/usecases/get_all_tv_shows_watchlist_usecase.dart'
    as _i53;
import 'package:tmda/features/account/domain/usecases/get_movie_show_watchlist_states_usecase.dart'
    as _i57;
import 'package:tmda/features/account/domain/usecases/get_movies_watchlist_usecase.dart'
    as _i58;
import 'package:tmda/features/account/domain/usecases/get_tv_show_watchlist_states_usecase.dart'
    as _i73;
import 'package:tmda/features/account/domain/usecases/get_tv_shows_watchlist_usecase.dart'
    as _i76;
import 'package:tmda/features/account/presentation/bloc/account/account_bloc.dart'
    as _i95;
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart'
    as _i92;
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart'
    as _i11;
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart'
    as _i13;
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart'
    as _i12;
import 'package:tmda/features/auth/domain/usecases/check_user_login_session_usecase.dart'
    as _i14;
import 'package:tmda/features/auth/domain/usecases/user_forget_password_usecase.dart'
    as _i28;
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart'
    as _i29;
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart'
    as _i30;
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart' as _i37;
import 'package:tmda/features/auth/presentation/cubit/login_cubit.dart' as _i77;
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart'
    as _i15;
import 'package:tmda/features/movie/data/repositories/movies_repository_impl.dart'
    as _i17;
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart'
    as _i16;
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart'
    as _i59;
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart'
    as _i60;
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart'
    as _i62;
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart'
    as _i69;
import 'package:tmda/features/movie/domain/usecases/movie_details/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i34;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart'
    as _i55;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_session_id_usecase.dart'
    as _i67;
import 'package:tmda/features/movie/domain/usecases/movie_details/play_movie_video_usecase.dart'
    as _i21;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_new_movies_usecase.dart'
    as _i44;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_popular_movies_usecase.dart'
    as _i45;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_recommended_movies_usecase.dart'
    as _i47;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_similar_movies_usecase.dart'
    as _i49;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_all_top_rated_movies_usecase.dart'
    as _i51;
import 'package:tmda/features/movie/domain/usecases/see_all_movies/get_movie_states_usecase.dart'
    as _i56;
import 'package:tmda/features/movie/presentation/bloc/movie_details/movie_details_bloc.dart'
    as _i78;
import 'package:tmda/features/movie/presentation/bloc/movies/movies_bloc.dart'
    as _i79;
import 'package:tmda/features/movie/presentation/bloc/see_all_movies/see_all_movies_bloc.dart'
    as _i87;
import 'package:tmda/features/person/data/datasources/person_data_source.dart'
    as _i18;
import 'package:tmda/features/person/data/repositories/person_repository_impl.dart'
    as _i20;
import 'package:tmda/features/person/domain/repositories/person_repository.dart'
    as _i19;
import 'package:tmda/features/person/domain/usecases/get_person_details_usecase.dart'
    as _i61;
import 'package:tmda/features/person/presentation/bloc/person_cubit.dart'
    as _i80;
import 'package:tmda/features/search/data/datasources/search_data_source.dart'
    as _i22;
import 'package:tmda/features/search/data/repositories/search_repository_impl.dart'
    as _i24;
import 'package:tmda/features/search/domain/repositories/search_repository.dart'
    as _i23;
import 'package:tmda/features/search/domain/usecases/add_or_remove_search_content_from_watchlist_usecase.dart'
    as _i35;
import 'package:tmda/features/search/domain/usecases/check_for_movie_search_states_usecase.dart'
    as _i38;
import 'package:tmda/features/search/domain/usecases/check_for_tv_show_states_search_usecase.dart'
    as _i39;
import 'package:tmda/features/search/domain/usecases/get_search_session_id_usecase.dart'
    as _i65;
import 'package:tmda/features/search/domain/usecases/search_for_movie_usecase.dart'
    as _i84;
import 'package:tmda/features/search/domain/usecases/search_for_person_usecase.dart'
    as _i85;
import 'package:tmda/features/search/domain/usecases/search_for_tv_show_usecase.dart'
    as _i86;
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart'
    as _i93;
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart' as _i25;
import 'package:tmda/features/tv/data/repositories/tv_repository_impl.dart'
    as _i27;
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart'
    as _i26;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_popular_tv_shows_usecase.dart'
    as _i46;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_recommended_tv_shows_usecase.dart'
    as _i48;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_similar_tv_shows_usecase.dart'
    as _i50;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_top_rated_tv_shows_usecase.dart'
    as _i52;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_all_tv_shows_airing_today_usecase.dart'
    as _i42;
import 'package:tmda/features/tv/domain/usecases/see_all_tv_shows/get_tv_show_states_usecase.dart'
    as _i72;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/add_or_remove_tv_from_watchlist_usecase.dart'
    as _i36;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_episode_video_usecase.dart'
    as _i54;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_recommended_tv_shows_usecase.dart'
    as _i64;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_season_episodes_usecase.dart'
    as _i66;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_similar_tv_shows_usecase.dart'
    as _i68;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart'
    as _i71;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart'
    as _i81;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/tv_get_session_key_usecase.dart'
    as _i88;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_popular_tv_shows.dart'
    as _i63;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_top_rated_tv_shows.dart'
    as _i70;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_this_week_usecase.dart'
    as _i74;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_today.dart'
    as _i75;
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows/see_all_tv_shows_bloc.dart'
    as _i94;
import 'package:tmda/features/tv/presentation/bloc/tv_show/tv_show_bloc.dart'
    as _i90;
import 'package:tmda/features/tv/presentation/bloc/tv_show_details/tv_show_details_bloc.dart'
    as _i89;
import 'package:tmda/register_module.dart' as _i96;

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
    gh.lazySingleton<_i18.PersonDataSource>(
        () => _i18.PersonDataSourceImpl(gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i19.PersonRepository>(
        () => _i20.PersonRepositoryImpl(gh<_i18.PersonDataSource>()));
    gh.lazySingleton<_i21.PlayMovieVideoUseCase>(() =>
        _i21.PlayMovieVideoUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i22.SearchDataSource>(
        () => _i22.SearchDataSourceIml(gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i23.SearchRepository>(() => _i24.SearchRepositoryImpl(
          gh<_i22.SearchDataSource>(),
          gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i25.TvDataSource>(
        () => _i25.TvDataSourceImpl(apiConsumer: gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i26.TvShowsRepository>(() => _i27.TvRepositoryImpl(
          tvDataSource: gh<_i25.TvDataSource>(),
          localDataSource: gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i28.UserForgetPasswordUseCase>(() =>
        _i28.UserForgetPasswordUseCase(
            authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i29.UserLoginUseCase>(
        () => _i29.UserLoginUseCase(authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i30.UserRegisterUseCase>(() =>
        _i30.UserRegisterUseCase(authRepository: gh<_i12.AuthRepository>()));
    gh.lazySingleton<_i31.AccountDataSource>(
        () => _i31.AccountDataSourceImpl(gh<_i9.ApiConsumer>()));
    gh.lazySingleton<_i32.AccountRepository>(() => _i33.AccountRepositoryImpl(
          gh<_i31.AccountDataSource>(),
          gh<_i8.LocalDataSource>(),
        ));
    gh.lazySingleton<_i34.AddOrRemoveMovieFromWatchListUseCase>(() =>
        _i34.AddOrRemoveMovieFromWatchListUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i35.AddOrRemoveSearchContentFromWatchListUseCase>(() =>
        _i35.AddOrRemoveSearchContentFromWatchListUseCase(
            gh<_i23.SearchRepository>()));
    gh.lazySingleton<_i36.AddOrRemoveTvFromWatchListUseCase>(() =>
        _i36.AddOrRemoveTvFromWatchListUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.factory<_i37.AuthCubit>(() => _i37.AuthCubit(
          checkUserLoggedInUseCase: gh<_i14.CheckUserLoginSessionUseCase>(),
          userRegisterUseCase: gh<_i30.UserRegisterUseCase>(),
        ));
    gh.lazySingleton<_i38.CheckForMovieSearchStateUseCase>(() =>
        _i38.CheckForMovieSearchStateUseCase(gh<_i23.SearchRepository>()));
    gh.lazySingleton<_i39.CheckForTvShowSearchStateUseCase>(() =>
        _i39.CheckForTvShowSearchStateUseCase(gh<_i23.SearchRepository>()));
    gh.lazySingleton<_i40.GetAccountDetailsUseCase>(
        () => _i40.GetAccountDetailsUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i41.GetAccountSessionIdUseCase>(
        () => _i41.GetAccountSessionIdUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i42.GetAllAiringTodayTvShowsUseCase>(() =>
        _i42.GetAllAiringTodayTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i43.GetAllMoviesWatchListUseCase>(
        () => _i43.GetAllMoviesWatchListUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i44.GetAllNewMoviesUseCase>(() =>
        _i44.GetAllNewMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i45.GetAllPopularMoviesUseCase>(() =>
        _i45.GetAllPopularMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i46.GetAllPopularTvShowsUseCase>(() =>
        _i46.GetAllPopularTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i47.GetAllRecommendedMoviesUseCase>(() =>
        _i47.GetAllRecommendedMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i48.GetAllRecommendedTvShowsUseCase>(() =>
        _i48.GetAllRecommendedTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i49.GetAllSimilarMoviesUseCase>(() =>
        _i49.GetAllSimilarMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i50.GetAllSimilarTvShowsUseCase>(() =>
        _i50.GetAllSimilarTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i51.GetAllTopRatedMoviesUseCase>(() =>
        _i51.GetAllTopRatedMoviesUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i52.GetAllTopRatedTvShowsUseCase>(() =>
        _i52.GetAllTopRatedTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i53.GetAllTvShowsWatchListUseCase>(
        () => _i53.GetAllTvShowsWatchListUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i54.GetEpisodeVideoUseCase>(() =>
        _i54.GetEpisodeVideoUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i55.GetMovieDetailsUseCase>(() =>
        _i55.GetMovieDetailsUseCase(
            moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i56.GetMovieStateUseCase>(() => _i56.GetMovieStateUseCase(
        moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i57.GetMovieWatchListStatesUseCase>(() =>
        _i57.GetMovieWatchListStatesUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i58.GetMoviesWatchListUseCase>(
        () => _i58.GetMoviesWatchListUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i59.GetNewMoviesUseCase>(() =>
        _i59.GetNewMoviesUseCase(movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i60.GetNowPlayingMoviesUseCase>(() =>
        _i60.GetNowPlayingMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i61.GetPersonDetailsUseCase>(
        () => _i61.GetPersonDetailsUseCase(gh<_i19.PersonRepository>()));
    gh.lazySingleton<_i62.GetPopularMoviesUseCase>(() =>
        _i62.GetPopularMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i63.GetPopularTvShowsUseCase>(() =>
        _i63.GetPopularTvShowsUseCase(
            tvRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i64.GetRecommendedTvShowsUseCase>(() =>
        _i64.GetRecommendedTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i65.GetSearchSessionIdUseCase>(
        () => _i65.GetSearchSessionIdUseCase(gh<_i23.SearchRepository>()));
    gh.lazySingleton<_i66.GetSeasonsEpisodesUseCase>(() =>
        _i66.GetSeasonsEpisodesUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i67.GetSessionIdUseCase>(() => _i67.GetSessionIdUseCase(
        moviesRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i68.GetSimilarTvShowsUseCase>(() =>
        _i68.GetSimilarTvShowsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i69.GetTopRatedMoviesUseCase>(() =>
        _i69.GetTopRatedMoviesUseCase(
            movieRepository: gh<_i16.MoviesRepository>()));
    gh.lazySingleton<_i70.GetTopRatedTvShowsUseCase>(() =>
        _i70.GetTopRatedTvShowsUseCase(
            tvRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i71.GetTvShowDetailsUseCase>(() =>
        _i71.GetTvShowDetailsUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i72.GetTvShowStateUseCase>(() =>
        _i72.GetTvShowStateUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i73.GetTvShowWatchListStatesUseCase>(() =>
        _i73.GetTvShowWatchListStatesUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i74.GetTvShowsAiringThisWeekUseCase>(() =>
        _i74.GetTvShowsAiringThisWeekUseCase(
            tvRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i75.GetTvShowsAiringTodayUseCase>(() =>
        _i75.GetTvShowsAiringTodayUseCase(
            tvRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i76.GetTvShowsWatchListUseCase>(
        () => _i76.GetTvShowsWatchListUseCase(gh<_i32.AccountRepository>()));
    gh.factory<_i77.LoginCubit>(() => _i77.LoginCubit(
          userRegisterUseCase: gh<_i30.UserRegisterUseCase>(),
          userForgetPasswordUseCase: gh<_i28.UserForgetPasswordUseCase>(),
          userLoginUseCase: gh<_i29.UserLoginUseCase>(),
        ));
    gh.factory<_i78.MovieDetailsBloc>(() => _i78.MovieDetailsBloc(
          getMovieDetailsUseCase: gh<_i55.GetMovieDetailsUseCase>(),
          getSessionIdUseCase: gh<_i67.GetSessionIdUseCase>(),
          playMovieTrailerUseCase: gh<_i21.PlayMovieVideoUseCase>(),
          addOrRemoveFromWatchListUseCase:
              gh<_i34.AddOrRemoveMovieFromWatchListUseCase>(),
          getMovieStateUseCase: gh<_i56.GetMovieStateUseCase>(),
        ));
    gh.factory<_i79.MoviesBloc>(() => _i79.MoviesBloc(
          getNowPlayingMoviesUseCase: gh<_i60.GetNowPlayingMoviesUseCase>(),
          getPopularMoviesUseCase: gh<_i62.GetPopularMoviesUseCase>(),
          getTopRatedMoviesUseCase: gh<_i69.GetTopRatedMoviesUseCase>(),
          getNewMoviesUseCase: gh<_i59.GetNewMoviesUseCase>(),
        ));
    gh.factory<_i80.PersonCubit>(
        () => _i80.PersonCubit(gh<_i61.GetPersonDetailsUseCase>()));
    gh.lazySingleton<_i81.PlayTvShowVideoUseCase>(() =>
        _i81.PlayTvShowVideoUseCase(
            tvShowsRepository: gh<_i26.TvShowsRepository>()));
    gh.lazySingleton<_i82.RemoveMovieFromWatchListUseCase>(() =>
        _i82.RemoveMovieFromWatchListUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i83.RemoveTvShowFromWatchListUseCase>(() =>
        _i83.RemoveTvShowFromWatchListUseCase(gh<_i32.AccountRepository>()));
    gh.lazySingleton<_i84.SearchForMovieUseCase>(
        () => _i84.SearchForMovieUseCase(gh<_i23.SearchRepository>()));
    gh.lazySingleton<_i85.SearchForPersonUseCase>(
        () => _i85.SearchForPersonUseCase(gh<_i23.SearchRepository>()));
    gh.lazySingleton<_i86.SearchForTvShowUseCase>(
        () => _i86.SearchForTvShowUseCase(gh<_i23.SearchRepository>()));
    gh.factory<_i87.SeeAllMoviesBloc>(() => _i87.SeeAllMoviesBloc(
          gh<_i44.GetAllNewMoviesUseCase>(),
          gh<_i45.GetAllPopularMoviesUseCase>(),
          gh<_i51.GetAllTopRatedMoviesUseCase>(),
          gh<_i47.GetAllRecommendedMoviesUseCase>(),
          gh<_i49.GetAllSimilarMoviesUseCase>(),
          gh<_i34.AddOrRemoveMovieFromWatchListUseCase>(),
          gh<_i56.GetMovieStateUseCase>(),
          gh<_i67.GetSessionIdUseCase>(),
        ));
    gh.lazySingleton<_i88.TvGetSessionIdUseCase>(
        () => _i88.TvGetSessionIdUseCase(gh<_i26.TvShowsRepository>()));
    gh.factory<_i89.TvShowDetailsBloc>(() => _i89.TvShowDetailsBloc(
          getTvShowDetailsUseCase: gh<_i71.GetTvShowDetailsUseCase>(),
          getSeasonsEpisodesUseCase: gh<_i66.GetSeasonsEpisodesUseCase>(),
          getSessionIdUseCase: gh<_i88.TvGetSessionIdUseCase>(),
          addOrRemoveTvFromWatchListUseCase:
              gh<_i36.AddOrRemoveTvFromWatchListUseCase>(),
          playTvShowVideoUseCase: gh<_i81.PlayTvShowVideoUseCase>(),
          getEpisodeVideoUseCase: gh<_i54.GetEpisodeVideoUseCase>(),
          getTvShowStateUseCase: gh<_i72.GetTvShowStateUseCase>(),
        ));
    gh.factory<_i90.TvShowsBloc>(() => _i90.TvShowsBloc(
          getTvShowsAiringTodayUseCase: gh<_i75.GetTvShowsAiringTodayUseCase>(),
          getTvShowsAiringThisWeekUseCase:
              gh<_i74.GetTvShowsAiringThisWeekUseCase>(),
          getPopularTvShowsUseCase: gh<_i63.GetPopularTvShowsUseCase>(),
          getTopRatedTvShowsUseCase: gh<_i70.GetTopRatedTvShowsUseCase>(),
        ));
    gh.lazySingleton<_i91.AccountLogoutUseCase>(
        () => _i91.AccountLogoutUseCase(gh<_i32.AccountRepository>()));
    gh.factory<_i92.AccountSeeAllBloc>(() => _i92.AccountSeeAllBloc(
          gh<_i41.GetAccountSessionIdUseCase>(),
          gh<_i43.GetAllMoviesWatchListUseCase>(),
          gh<_i53.GetAllTvShowsWatchListUseCase>(),
          gh<_i73.GetTvShowWatchListStatesUseCase>(),
          gh<_i83.RemoveTvShowFromWatchListUseCase>(),
          gh<_i57.GetMovieWatchListStatesUseCase>(),
          gh<_i82.RemoveMovieFromWatchListUseCase>(),
        ));
    gh.factory<_i93.SearchBloc>(() => _i93.SearchBloc(
          gh<_i65.GetSearchSessionIdUseCase>(),
          gh<_i86.SearchForTvShowUseCase>(),
          gh<_i84.SearchForMovieUseCase>(),
          gh<_i85.SearchForPersonUseCase>(),
          gh<_i35.AddOrRemoveSearchContentFromWatchListUseCase>(),
          gh<_i38.CheckForMovieSearchStateUseCase>(),
          gh<_i39.CheckForTvShowSearchStateUseCase>(),
        ));
    gh.factory<_i94.SeeAllTvShowsBloc>(() => _i94.SeeAllTvShowsBloc(
          gh<_i88.TvGetSessionIdUseCase>(),
          gh<_i42.GetAllAiringTodayTvShowsUseCase>(),
          gh<_i46.GetAllPopularTvShowsUseCase>(),
          gh<_i52.GetAllTopRatedTvShowsUseCase>(),
          gh<_i48.GetAllRecommendedTvShowsUseCase>(),
          gh<_i50.GetAllSimilarTvShowsUseCase>(),
          gh<_i72.GetTvShowStateUseCase>(),
          gh<_i36.AddOrRemoveTvFromWatchListUseCase>(),
        ));
    gh.factory<_i95.AccountBloc>(() => _i95.AccountBloc(
          gh<_i40.GetAccountDetailsUseCase>(),
          gh<_i58.GetMoviesWatchListUseCase>(),
          gh<_i76.GetTvShowsWatchListUseCase>(),
          gh<_i91.AccountLogoutUseCase>(),
          gh<_i41.GetAccountSessionIdUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i96.RegisterModule {}
