// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tmda/config/router/app_router.dart' as _i4;
import 'package:tmda/core/api/api_consumer.dart' as _i3;
import 'package:tmda/core/api/authenticated_interceptor.dart' as _i85;
import 'package:tmda/core/api/dio_logger.dart' as _i7;
import 'package:tmda/core/api/unauthenticated_interceptor.dart' as _i25;
import 'package:tmda/features/account/data/datasources/account_data_source.dart'
    as _i26;
import 'package:tmda/features/account/data/repositories/account_repository_impl.dart'
    as _i28;
import 'package:tmda/features/account/domain/repositories/account_repository.dart'
    as _i27;
import 'package:tmda/features/account/domain/usecases/account/account_logout_usecase.dart'
    as _i82;
import 'package:tmda/features/account/domain/usecases/account/get_account_details_usecase.dart'
    as _i34;
import 'package:tmda/features/account/domain/usecases/account_movies_watchlist/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i70;
import 'package:tmda/features/account/domain/usecases/account_movies_watchlist/get_all_movies_watchlist_usecase.dart'
    as _i36;
import 'package:tmda/features/account/domain/usecases/account_movies_watchlist/get_movie_watchlist_states_usecase.dart'
    as _i49;
import 'package:tmda/features/account/domain/usecases/account_movies_watchlist/get_movies_watchlist_usecase.dart'
    as _i50;
import 'package:tmda/features/account/domain/usecases/account_tv_shows_watchlist/add_or_remove_tv_show_from_watch_list_usecase.dart'
    as _i71;
import 'package:tmda/features/account/domain/usecases/account_tv_shows_watchlist/get_all_tv_shows_watchlist_usecase.dart'
    as _i46;
import 'package:tmda/features/account/domain/usecases/account_tv_shows_watchlist/get_tv_show_watchlist_states_usecase.dart'
    as _i62;
import 'package:tmda/features/account/domain/usecases/account_tv_shows_watchlist/get_tv_shows_watchlist_usecase.dart'
    as _i65;
import 'package:tmda/features/account/presentation/bloc/account_see_all/account_see_all_bloc.dart'
    as _i83;
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart'
    as _i5;
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart'
    as _i32;
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart'
    as _i31;
import 'package:tmda/features/auth/domain/usecases/user_forget_password_usecase.dart'
    as _i79;
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart'
    as _i80;
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart'
    as _i81;
import 'package:tmda/features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i86;
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart'
    as _i12;
import 'package:tmda/features/movie/data/repositories/movies_repository_impl.dart'
    as _i14;
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart'
    as _i13;
import 'package:tmda/features/movie/domain/usecases/add_or_remove_movie_from_watch_list_usecase.dart'
    as _i29;
import 'package:tmda/features/movie/domain/usecases/get_movie_states_usecase.dart'
    as _i48;
import 'package:tmda/features/movie/domain/usecases/movie/get_new_movies_usecase.dart'
    as _i51;
import 'package:tmda/features/movie/domain/usecases/movie/get_now_playing_movies_usecase.dart'
    as _i52;
import 'package:tmda/features/movie/domain/usecases/movie/get_popular_movies_usecase.dart'
    as _i54;
import 'package:tmda/features/movie/domain/usecases/movie/get_top_rated_movies_usecase.dart'
    as _i58;
import 'package:tmda/features/movie/domain/usecases/movie_details/get_movie_details_usecase.dart'
    as _i47;
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
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart'
    as _i66;
import 'package:tmda/features/movie/presentation/bloc/movies_cubit/movies_cubit.dart'
    as _i67;
import 'package:tmda/features/movie/presentation/bloc/see_all_movies_bloc/see_all_movies_bloc.dart'
    as _i75;
import 'package:tmda/features/person/data/datasources/person_data_source.dart'
    as _i15;
import 'package:tmda/features/person/data/repositories/person_repository_impl.dart'
    as _i17;
import 'package:tmda/features/person/domain/repositories/person_repository.dart'
    as _i16;
import 'package:tmda/features/person/domain/usecases/get_person_details_usecase.dart'
    as _i53;
import 'package:tmda/features/person/presentation/cubit/person_cubit.dart'
    as _i68;
import 'package:tmda/features/search/data/datasources/search_data_source.dart'
    as _i19;
import 'package:tmda/features/search/data/repositories/search_repository_impl.dart'
    as _i21;
import 'package:tmda/features/search/domain/repositories/search_repository.dart'
    as _i20;
import 'package:tmda/features/search/domain/usecases/get_search_session_id_usecase.dart'
    as _i56;
import 'package:tmda/features/search/domain/usecases/search_for_movie_usecase.dart'
    as _i72;
import 'package:tmda/features/search/domain/usecases/search_for_person_usecase.dart'
    as _i73;
import 'package:tmda/features/search/domain/usecases/search_for_tv_show_usecase.dart'
    as _i74;
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart'
    as _i87;
import 'package:tmda/features/shared/data/datasources/local_data_source.dart'
    as _i9;
import 'package:tmda/features/shared/data/repositories/local_repository_impl.dart'
    as _i11;
import 'package:tmda/features/shared/domain/repositories/local_repository.dart'
    as _i10;
import 'package:tmda/features/shared/domain/usecases/check_user_login_session_usecase.dart'
    as _i33;
import 'package:tmda/features/shared/domain/usecases/get_session_id_usecase.dart'
    as _i57;
import 'package:tmda/features/shared/presentation/blocs/account_cubit/account_bloc.dart'
    as _i88;
import 'package:tmda/features/shared/presentation/blocs/local_cubit/local_cubit.dart'
    as _i84;
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart' as _i22;
import 'package:tmda/features/tv/data/repositories/tv_repository_impl.dart'
    as _i24;
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart'
    as _i23;
import 'package:tmda/features/tv/domain/usecases/add_or_remove_tv_from_watchlist_usecase.dart'
    as _i30;
import 'package:tmda/features/tv/domain/usecases/get_tv_show_states_usecase.dart'
    as _i61;
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
import 'package:tmda/features/tv/domain/usecases/tv_show_details/get_tv_show_details_usecase.dart'
    as _i60;
import 'package:tmda/features/tv/domain/usecases/tv_show_details/play_tv_show_video_usecase.dart'
    as _i69;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_popular_tv_shows.dart'
    as _i55;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_top_rated_tv_shows.dart'
    as _i59;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_this_week_usecase.dart'
    as _i63;
import 'package:tmda/features/tv/domain/usecases/tv_shows/get_tv_shows_airing_today.dart'
    as _i64;
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows_bloc/see_all_tv_shows_bloc.dart'
    as _i76;
import 'package:tmda/features/tv/presentation/bloc/tv_show_cubit/tv_show_cubit.dart'
    as _i78;
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart'
    as _i77;
import 'package:tmda/register_module.dart' as _i89;

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
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.mainApiConsumer,
      instanceName: 'unAuthenticatedConsumer',
    );
    gh.lazySingleton<_i3.ApiConsumer>(
      () => registerModule.authenticatedApiConsumer,
      instanceName: 'authenticatedConsumer',
    );
    gh.singleton<_i4.AppRouter>(_i4.AppRouter());
    gh.lazySingleton<_i5.AuthDataSource>(() => _i5.AuthDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'unAuthenticatedConsumer')));
    gh.lazySingleton<_i6.Dio>(() => registerModule.dioClient);
    gh.lazySingleton<_i7.DioLogInterceptor>(() => _i7.DioLogInterceptor());
    gh.lazySingleton<_i8.FlutterSecureStorage>(
        () => registerModule.localStorage);
    gh.lazySingleton<_i9.LocalDataSource>(
        () => _i9.LocalDataSourceImpl(gh<_i8.FlutterSecureStorage>()));
    gh.lazySingleton<_i10.LocalRepository>(
        () => _i11.LocalRepositoryImpl(gh<_i9.LocalDataSource>()));
    gh.lazySingleton<_i12.MoviesDataSource>(() => _i12.MoviesDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i13.MoviesRepository>(
        () => _i14.MoviesRepositoryImpl(gh<_i12.MoviesDataSource>()));
    gh.lazySingleton<_i15.PersonDataSource>(() => _i15.PersonDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'unAuthenticatedConsumer')));
    gh.lazySingleton<_i16.PersonRepository>(
        () => _i17.PersonRepositoryImpl(gh<_i15.PersonDataSource>()));
    gh.lazySingleton<_i18.PlayMovieVideoUseCase>(
        () => _i18.PlayMovieVideoUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i19.SearchDataSource>(() => _i19.SearchDataSourceIml(
        gh<_i3.ApiConsumer>(instanceName: 'unAuthenticatedConsumer')));
    gh.lazySingleton<_i20.SearchRepository>(() => _i21.SearchRepositoryImpl(
          gh<_i19.SearchDataSource>(),
          gh<_i9.LocalDataSource>(),
        ));
    gh.lazySingleton<_i22.TvDataSource>(() => _i22.TvDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i23.TvShowsRepository>(() => _i24.TvRepositoryImpl(
          tvDataSource: gh<_i22.TvDataSource>(),
          localDataSource: gh<_i9.LocalDataSource>(),
        ));
    gh.lazySingleton<_i25.UnAuthenticatedInterceptor>(
        () => _i25.UnAuthenticatedInterceptor());
    gh.lazySingleton<_i26.AccountDataSource>(() => _i26.AccountDataSourceImpl(
        gh<_i3.ApiConsumer>(instanceName: 'authenticatedConsumer')));
    gh.lazySingleton<_i27.AccountRepository>(() => _i28.AccountRepositoryImpl(
          gh<_i26.AccountDataSource>(),
          gh<_i9.LocalDataSource>(),
        ));
    gh.lazySingleton<_i29.AddOrRemoveMovieFromWatchListUseCase>(() =>
        _i29.AddOrRemoveMovieFromWatchListUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i30.AddOrRemoveTvFromWatchListUseCase>(() =>
        _i30.AddOrRemoveTvFromWatchListUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i31.AuthRepository>(() => _i32.AuthRepositoryImpl(
          gh<_i5.AuthDataSource>(),
          gh<_i9.LocalDataSource>(),
        ));
    gh.lazySingleton<_i33.CheckUserLoginSessionUseCase>(
        () => _i33.CheckUserLoginSessionUseCase(gh<_i10.LocalRepository>()));
    gh.lazySingleton<_i34.GetAccountDetailsUseCase>(
        () => _i34.GetAccountDetailsUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i35.GetAllAiringTodayTvShowsUseCase>(() =>
        _i35.GetAllAiringTodayTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i36.GetAllMoviesWatchListUseCase>(
        () => _i36.GetAllMoviesWatchListUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i37.GetAllNewMoviesUseCase>(
        () => _i37.GetAllNewMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i38.GetAllPopularMoviesUseCase>(
        () => _i38.GetAllPopularMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i39.GetAllPopularTvShowsUseCase>(
        () => _i39.GetAllPopularTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i40.GetAllRecommendedMoviesUseCase>(
        () => _i40.GetAllRecommendedMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i41.GetAllRecommendedTvShowsUseCase>(() =>
        _i41.GetAllRecommendedTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i42.GetAllSimilarMoviesUseCase>(
        () => _i42.GetAllSimilarMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i43.GetAllSimilarTvShowsUseCase>(
        () => _i43.GetAllSimilarTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i44.GetAllTopRatedMoviesUseCase>(
        () => _i44.GetAllTopRatedMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i45.GetAllTopRatedTvShowsUseCase>(
        () => _i45.GetAllTopRatedTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i46.GetAllTvShowsWatchListUseCase>(
        () => _i46.GetAllTvShowsWatchListUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i47.GetMovieDetailsUseCase>(
        () => _i47.GetMovieDetailsUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i48.GetMovieStateUseCase>(
        () => _i48.GetMovieStateUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i49.GetMovieWatchListStatesUseCase>(() =>
        _i49.GetMovieWatchListStatesUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i50.GetMoviesWatchListUseCase>(
        () => _i50.GetMoviesWatchListUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i51.GetNewMoviesUseCase>(
        () => _i51.GetNewMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i52.GetNowPlayingMoviesUseCase>(
        () => _i52.GetNowPlayingMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i53.GetPersonDetailsUseCase>(
        () => _i53.GetPersonDetailsUseCase(gh<_i16.PersonRepository>()));
    gh.lazySingleton<_i54.GetPopularMoviesUseCase>(
        () => _i54.GetPopularMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i55.GetPopularTvShowsUseCase>(
        () => _i55.GetPopularTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i56.GetSearchSessionIdUseCase>(
        () => _i56.GetSearchSessionIdUseCase(gh<_i20.SearchRepository>()));
    gh.lazySingleton<_i57.GetSessionIdUseCase>(
        () => _i57.GetSessionIdUseCase(gh<_i10.LocalRepository>()));
    gh.lazySingleton<_i58.GetTopRatedMoviesUseCase>(
        () => _i58.GetTopRatedMoviesUseCase(gh<_i13.MoviesRepository>()));
    gh.lazySingleton<_i59.GetTopRatedTvShowsUseCase>(
        () => _i59.GetTopRatedTvShowsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i60.GetTvShowDetailsUseCase>(
        () => _i60.GetTvShowDetailsUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i61.GetTvShowStateUseCase>(
        () => _i61.GetTvShowStateUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i62.GetTvShowWatchListStatesUseCase>(() =>
        _i62.GetTvShowWatchListStatesUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i63.GetTvShowsAiringThisWeekUseCase>(() =>
        _i63.GetTvShowsAiringThisWeekUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i64.GetTvShowsAiringTodayUseCase>(
        () => _i64.GetTvShowsAiringTodayUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i65.GetTvShowsWatchListUseCase>(
        () => _i65.GetTvShowsWatchListUseCase(gh<_i27.AccountRepository>()));
    gh.factory<_i66.MovieDetailsCubit>(() => _i66.MovieDetailsCubit(
          gh<_i47.GetMovieDetailsUseCase>(),
          gh<_i18.PlayMovieVideoUseCase>(),
          gh<_i29.AddOrRemoveMovieFromWatchListUseCase>(),
          gh<_i48.GetMovieStateUseCase>(),
        ));
    gh.factory<_i67.MoviesCubit>(() => _i67.MoviesCubit(
          gh<_i52.GetNowPlayingMoviesUseCase>(),
          gh<_i54.GetPopularMoviesUseCase>(),
          gh<_i58.GetTopRatedMoviesUseCase>(),
          gh<_i51.GetNewMoviesUseCase>(),
        ));
    gh.factory<_i68.PersonCubit>(
        () => _i68.PersonCubit(gh<_i53.GetPersonDetailsUseCase>()));
    gh.lazySingleton<_i69.PlayTvShowVideoUseCase>(
        () => _i69.PlayTvShowVideoUseCase(gh<_i23.TvShowsRepository>()));
    gh.lazySingleton<_i70.RemoveMovieFromWatchListUseCase>(() =>
        _i70.RemoveMovieFromWatchListUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i71.RemoveTvShowFromWatchListUseCase>(() =>
        _i71.RemoveTvShowFromWatchListUseCase(gh<_i27.AccountRepository>()));
    gh.lazySingleton<_i72.SearchForMovieUseCase>(
        () => _i72.SearchForMovieUseCase(gh<_i20.SearchRepository>()));
    gh.lazySingleton<_i73.SearchForPersonUseCase>(
        () => _i73.SearchForPersonUseCase(gh<_i20.SearchRepository>()));
    gh.lazySingleton<_i74.SearchForTvShowUseCase>(
        () => _i74.SearchForTvShowUseCase(gh<_i20.SearchRepository>()));
    gh.factory<_i75.SeeAllMoviesBloc>(() => _i75.SeeAllMoviesBloc(
          gh<_i37.GetAllNewMoviesUseCase>(),
          gh<_i38.GetAllPopularMoviesUseCase>(),
          gh<_i44.GetAllTopRatedMoviesUseCase>(),
          gh<_i40.GetAllRecommendedMoviesUseCase>(),
          gh<_i42.GetAllSimilarMoviesUseCase>(),
          gh<_i29.AddOrRemoveMovieFromWatchListUseCase>(),
          gh<_i48.GetMovieStateUseCase>(),
        ));
    gh.factory<_i76.SeeAllTvShowsBloc>(() => _i76.SeeAllTvShowsBloc(
          gh<_i35.GetAllAiringTodayTvShowsUseCase>(),
          gh<_i39.GetAllPopularTvShowsUseCase>(),
          gh<_i45.GetAllTopRatedTvShowsUseCase>(),
          gh<_i41.GetAllRecommendedTvShowsUseCase>(),
          gh<_i43.GetAllSimilarTvShowsUseCase>(),
          gh<_i61.GetTvShowStateUseCase>(),
          gh<_i30.AddOrRemoveTvFromWatchListUseCase>(),
        ));
    gh.factory<_i77.TvShowDetailsCubit>(() => _i77.TvShowDetailsCubit(
          gh<_i60.GetTvShowDetailsUseCase>(),
          gh<_i30.AddOrRemoveTvFromWatchListUseCase>(),
          gh<_i69.PlayTvShowVideoUseCase>(),
          gh<_i61.GetTvShowStateUseCase>(),
        ));
    gh.factory<_i78.TvShowsCubit>(() => _i78.TvShowsCubit(
          gh<_i64.GetTvShowsAiringTodayUseCase>(),
          gh<_i63.GetTvShowsAiringThisWeekUseCase>(),
          gh<_i55.GetPopularTvShowsUseCase>(),
          gh<_i59.GetTopRatedTvShowsUseCase>(),
        ));
    gh.lazySingleton<_i79.UserForgetPasswordUseCase>(
        () => _i79.UserForgetPasswordUseCase(gh<_i31.AuthRepository>()));
    gh.lazySingleton<_i80.UserLoginUseCase>(
        () => _i80.UserLoginUseCase(gh<_i31.AuthRepository>()));
    gh.lazySingleton<_i81.UserRegisterUseCase>(
        () => _i81.UserRegisterUseCase(gh<_i31.AuthRepository>()));
    gh.lazySingleton<_i82.AccountLogoutUseCase>(
        () => _i82.AccountLogoutUseCase(gh<_i27.AccountRepository>()));
    gh.factory<_i83.AccountSeeAllBloc>(() => _i83.AccountSeeAllBloc(
          gh<_i57.GetSessionIdUseCase>(),
          gh<_i36.GetAllMoviesWatchListUseCase>(),
          gh<_i46.GetAllTvShowsWatchListUseCase>(),
          gh<_i62.GetTvShowWatchListStatesUseCase>(),
          gh<_i71.RemoveTvShowFromWatchListUseCase>(),
          gh<_i49.GetMovieWatchListStatesUseCase>(),
          gh<_i70.RemoveMovieFromWatchListUseCase>(),
        ));
    gh.factory<_i84.LocalCubit>(() => _i84.LocalCubit(
          checkUserLoggedInUseCase: gh<_i33.CheckUserLoginSessionUseCase>(),
          userRegisterUseCase: gh<_i81.UserRegisterUseCase>(),
        ));
    gh.lazySingleton<_i85.AuthenticatedInterceptor>(
        () => _i85.AuthenticatedInterceptor(gh<_i57.GetSessionIdUseCase>()));
    gh.factory<_i86.LoginCubit>(() => _i86.LoginCubit(
          userRegisterUseCase: gh<_i81.UserRegisterUseCase>(),
          userForgetPasswordUseCase: gh<_i79.UserForgetPasswordUseCase>(),
          userLoginUseCase: gh<_i80.UserLoginUseCase>(),
        ));
    gh.factory<_i87.SearchBloc>(() => _i87.SearchBloc(
          gh<_i56.GetSearchSessionIdUseCase>(),
          gh<_i74.SearchForTvShowUseCase>(),
          gh<_i72.SearchForMovieUseCase>(),
          gh<_i73.SearchForPersonUseCase>(),
        ));
    gh.factory<_i88.AccountCubit>(() => _i88.AccountCubit(
          gh<_i34.GetAccountDetailsUseCase>(),
          gh<_i50.GetMoviesWatchListUseCase>(),
          gh<_i65.GetTvShowsWatchListUseCase>(),
          gh<_i82.AccountLogoutUseCase>(),
          gh<_i57.GetSessionIdUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i89.RegisterModule {}
