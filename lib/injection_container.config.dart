// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tmda/config/router/app_router.dart' as _i342;
import 'package:tmda/core/api/api_consumer.dart' as _i534;
import 'package:tmda/core/api/dio_interceptor.dart' as _i855;
import 'package:tmda/core/api/dio_logger.dart' as _i185;
import 'package:tmda/features/account/data/datasources/account_data_source.dart'
    as _i817;
import 'package:tmda/features/account/data/repositories/account_repository_impl.dart'
    as _i237;
import 'package:tmda/features/account/domain/repositories/account_repository.dart'
    as _i451;
import 'package:tmda/features/account/domain/usecases/account/account_logout_usecase.dart'
    as _i321;
import 'package:tmda/features/account/domain/usecases/account/get_account_details_usecase.dart'
    as _i435;
import 'package:tmda/features/account/presentation/bloc/account_cubit/account_bloc.dart'
    as _i894;
import 'package:tmda/features/auth/data/datasources/auth_data_source.dart'
    as _i274;
import 'package:tmda/features/auth/data/repositories/auth_repository_impl.dart'
    as _i485;
import 'package:tmda/features/auth/domain/repositories/auth_repository.dart'
    as _i594;
import 'package:tmda/features/auth/domain/usecases/user_forget_password_usecase.dart'
    as _i674;
import 'package:tmda/features/auth/domain/usecases/user_login_usecase.dart'
    as _i391;
import 'package:tmda/features/auth/domain/usecases/user_register_usecase.dart'
    as _i1035;
import 'package:tmda/features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i774;
import 'package:tmda/features/movie/data/datasources/movies_data_source.dart'
    as _i535;
import 'package:tmda/features/movie/data/repositories/movies_repository_impl.dart'
    as _i379;
import 'package:tmda/features/movie/domain/repositories/movies_repository.dart'
    as _i32;
import 'package:tmda/features/movie/domain/usecases/get_movie_details_usecase.dart'
    as _i410;
import 'package:tmda/features/movie/domain/usecases/get_new_movies_usecase.dart'
    as _i586;
import 'package:tmda/features/movie/domain/usecases/get_now_playing_movies_usecase.dart'
    as _i44;
import 'package:tmda/features/movie/domain/usecases/get_popular_movies_usecase.dart'
    as _i210;
import 'package:tmda/features/movie/domain/usecases/get_recommended_movies_usecase.dart'
    as _i65;
import 'package:tmda/features/movie/domain/usecases/get_similar_movies_usecase.dart'
    as _i8;
import 'package:tmda/features/movie/domain/usecases/get_top_rated_movies_usecase.dart'
    as _i948;
import 'package:tmda/features/movie/domain/usecases/play_movie_video_usecase.dart'
    as _i450;
import 'package:tmda/features/movie/presentation/bloc/movie_details_cubit/movie_details_cubit.dart'
    as _i59;
import 'package:tmda/features/movie/presentation/bloc/movies_cubit/movies_cubit.dart'
    as _i225;
import 'package:tmda/features/movie/presentation/bloc/see_all_movies_bloc/see_all_movies_bloc.dart'
    as _i990;
import 'package:tmda/features/person/data/datasources/person_data_source.dart'
    as _i335;
import 'package:tmda/features/person/data/repositories/person_repository_impl.dart'
    as _i108;
import 'package:tmda/features/person/domain/repositories/person_repository.dart'
    as _i514;
import 'package:tmda/features/person/domain/usecases/get_person_details_usecase.dart'
    as _i461;
import 'package:tmda/features/person/presentation/cubit/person_cubit.dart'
    as _i460;
import 'package:tmda/features/search/data/datasources/search_data_source.dart'
    as _i325;
import 'package:tmda/features/search/data/repositories/search_repository_impl.dart'
    as _i538;
import 'package:tmda/features/search/domain/repositories/search_repository.dart'
    as _i750;
import 'package:tmda/features/search/domain/usecases/get_search_session_id_usecase.dart'
    as _i340;
import 'package:tmda/features/search/domain/usecases/search_for_movie_usecase.dart'
    as _i680;
import 'package:tmda/features/search/domain/usecases/search_for_person_usecase.dart'
    as _i1025;
import 'package:tmda/features/search/domain/usecases/search_for_tv_show_usecase.dart'
    as _i838;
import 'package:tmda/features/search/presentation/bloc/search_bloc.dart'
    as _i392;
import 'package:tmda/features/shared/data/datasources/local_data_source.dart'
    as _i1071;
import 'package:tmda/features/shared/data/datasources/watch_list_datasource.dart'
    as _i831;
import 'package:tmda/features/shared/data/repositories/local_repository_impl.dart'
    as _i622;
import 'package:tmda/features/shared/data/repositories/watch_list_repository_impl.dart'
    as _i1024;
import 'package:tmda/features/shared/domain/repositories/local_repository.dart'
    as _i741;
import 'package:tmda/features/shared/domain/repositories/watch_list_repository.dart'
    as _i610;
import 'package:tmda/features/shared/domain/usecases/add_or_remove_movie_from_watchlist_usecase.dart'
    as _i485;
import 'package:tmda/features/shared/domain/usecases/add_or_remove_tvshow_from_watchlist_usecase.dart'
    as _i1029;
import 'package:tmda/features/shared/domain/usecases/check_user_login_session_usecase.dart'
    as _i859;
import 'package:tmda/features/shared/domain/usecases/get_movies_watch_list_usecase.dart'
    as _i419;
import 'package:tmda/features/shared/domain/usecases/get_movies_watchlist_ids_set_usecase.dart'
    as _i538;
import 'package:tmda/features/shared/domain/usecases/get_session_id_usecase.dart'
    as _i951;
import 'package:tmda/features/shared/domain/usecases/get_tv_shows_watch_list_usecase.dart'
    as _i289;
import 'package:tmda/features/shared/domain/usecases/get_tv_shows_watchlist_ids_set_usecase.dart'
    as _i959;
import 'package:tmda/features/shared/presentation/blocs/auth_cubit/token_cubit.dart'
    as _i304;
import 'package:tmda/features/shared/presentation/blocs/watchlist_bloc/watchlist_bloc.dart'
    as _i723;
import 'package:tmda/features/tv/data/datasources/tv_data_source.dart' as _i632;
import 'package:tmda/features/tv/data/repositories/tv_repository_impl.dart'
    as _i727;
import 'package:tmda/features/tv/domain/repositories/tv_shows_repository.dart'
    as _i884;
import 'package:tmda/features/tv/domain/usecases/get_popular_tv_shows.dart'
    as _i702;
import 'package:tmda/features/tv/domain/usecases/get_recommended_tv_shows_usecase.dart'
    as _i848;
import 'package:tmda/features/tv/domain/usecases/get_similar_tv_shows_usecase.dart'
    as _i974;
import 'package:tmda/features/tv/domain/usecases/get_top_rated_tv_shows.dart'
    as _i788;
import 'package:tmda/features/tv/domain/usecases/get_tv_show_details_usecase.dart'
    as _i514;
import 'package:tmda/features/tv/domain/usecases/get_tv_shows_airing_this_week_usecase.dart'
    as _i1051;
import 'package:tmda/features/tv/domain/usecases/get_tv_shows_airing_today.dart'
    as _i1069;
import 'package:tmda/features/tv/domain/usecases/play_tv_show_video_usecase.dart'
    as _i751;
import 'package:tmda/features/tv/presentation/bloc/see_all_tv_shows_bloc/see_all_tv_shows_bloc.dart'
    as _i627;
import 'package:tmda/features/tv/presentation/bloc/tv_show_cubit/tv_show_cubit.dart'
    as _i623;
import 'package:tmda/features/tv/presentation/bloc/tv_show_details_cubit/tv_show_details_cubit.dart'
    as _i207;
import 'package:tmda/register_module.dart' as _i2;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dioClient);
    gh.singleton<_i342.AppRouter>(() => _i342.AppRouter());
    gh.lazySingleton<_i855.DioInterceptor>(() => _i855.DioInterceptor());
    gh.lazySingleton<_i185.DioLogInterceptor>(() => _i185.DioLogInterceptor());
    gh.lazySingleton<_i534.ApiConsumer>(() => registerModule.dioConsumer);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.localStorage);
    gh.lazySingleton<_i817.AccountDataSource>(
        () => _i817.AccountDataSourceImpl(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i831.WatchListDataSource>(
        () => _i831.WatchListDataSourceImpl(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i335.PersonDataSource>(
        () => _i335.PersonDataSourceImpl(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i632.TvDataSource>(
        () => _i632.TvDataSourceImpl(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i535.MoviesDataSource>(
        () => _i535.MoviesDataSourceImpl(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i274.AuthDataSource>(
        () => _i274.AuthDataSourceImpl(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i32.MoviesRepository>(
        () => _i379.MoviesRepositoryImpl(gh<_i535.MoviesDataSource>()));
    gh.lazySingleton<_i610.WatchListRepository>(
        () => _i1024.WatchListRepositoryImpl(gh<_i831.WatchListDataSource>()));
    gh.lazySingleton<_i410.GetMovieDetailsUseCase>(
        () => _i410.GetMovieDetailsUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i586.GetNewMoviesUseCase>(
        () => _i586.GetNewMoviesUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i44.GetNowPlayingMoviesUseCase>(
        () => _i44.GetNowPlayingMoviesUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i210.GetPopularMoviesUseCase>(
        () => _i210.GetPopularMoviesUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i65.GetAllRecommendedMoviesUseCase>(
        () => _i65.GetAllRecommendedMoviesUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i8.GetAllSimilarMoviesUseCase>(
        () => _i8.GetAllSimilarMoviesUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i948.GetTopRatedMoviesUseCase>(
        () => _i948.GetTopRatedMoviesUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i450.PlayMovieVideoUseCase>(
        () => _i450.PlayMovieVideoUseCase(gh<_i32.MoviesRepository>()));
    gh.lazySingleton<_i1071.LocalDataSource>(
        () => _i1071.LocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i225.MoviesCubit>(() => _i225.MoviesCubit(
          gh<_i44.GetNowPlayingMoviesUseCase>(),
          gh<_i210.GetPopularMoviesUseCase>(),
          gh<_i948.GetTopRatedMoviesUseCase>(),
          gh<_i586.GetNewMoviesUseCase>(),
        ));
    gh.lazySingleton<_i514.PersonRepository>(
        () => _i108.PersonRepositoryImpl(gh<_i335.PersonDataSource>()));
    gh.lazySingleton<_i325.SearchDataSource>(
        () => _i325.SearchDataSourceIml(gh<_i534.ApiConsumer>()));
    gh.lazySingleton<_i461.GetPersonDetailsUseCase>(
        () => _i461.GetPersonDetailsUseCase(gh<_i514.PersonRepository>()));
    gh.factory<_i990.SeeAllMoviesBloc>(() => _i990.SeeAllMoviesBloc(
          gh<_i586.GetNewMoviesUseCase>(),
          gh<_i210.GetPopularMoviesUseCase>(),
          gh<_i948.GetTopRatedMoviesUseCase>(),
          gh<_i65.GetAllRecommendedMoviesUseCase>(),
          gh<_i8.GetAllSimilarMoviesUseCase>(),
        ));
    gh.lazySingleton<_i594.AuthRepository>(() => _i485.AuthRepositoryImpl(
          gh<_i274.AuthDataSource>(),
          gh<_i1071.LocalDataSource>(),
        ));
    gh.factory<_i460.PersonCubit>(
        () => _i460.PersonCubit(gh<_i461.GetPersonDetailsUseCase>()));
    gh.lazySingleton<_i741.LocalRepository>(
        () => _i622.LocalRepositoryImpl(gh<_i1071.LocalDataSource>()));
    gh.lazySingleton<_i485.AddOrRemoveMovieFromWatchListUseCase>(() =>
        _i485.AddOrRemoveMovieFromWatchListUseCase(
            gh<_i610.WatchListRepository>()));
    gh.lazySingleton<_i1029.AddOrRemoveTvShowFromWatchListUseCase>(() =>
        _i1029.AddOrRemoveTvShowFromWatchListUseCase(
            gh<_i610.WatchListRepository>()));
    gh.lazySingleton<_i538.GetMoviesWatchListIdsSetUseCase>(() =>
        _i538.GetMoviesWatchListIdsSetUseCase(gh<_i610.WatchListRepository>()));
    gh.lazySingleton<_i419.GetMoviesWatchListUseCase>(
        () => _i419.GetMoviesWatchListUseCase(gh<_i610.WatchListRepository>()));
    gh.lazySingleton<_i959.GetTvShowsWatchListIdsSetUseCase>(() =>
        _i959.GetTvShowsWatchListIdsSetUseCase(
            gh<_i610.WatchListRepository>()));
    gh.lazySingleton<_i289.GetTvShowsWatchListUseCase>(() =>
        _i289.GetTvShowsWatchListUseCase(gh<_i610.WatchListRepository>()));
    gh.factory<_i59.MovieDetailsCubit>(() => _i59.MovieDetailsCubit(
          gh<_i410.GetMovieDetailsUseCase>(),
          gh<_i450.PlayMovieVideoUseCase>(),
        ));
    gh.lazySingleton<_i451.AccountRepository>(() => _i237.AccountRepositoryImpl(
          gh<_i817.AccountDataSource>(),
          gh<_i1071.LocalDataSource>(),
        ));
    gh.lazySingleton<_i884.TvShowsRepository>(() => _i727.TvRepositoryImpl(
          tvDataSource: gh<_i632.TvDataSource>(),
          localDataSource: gh<_i1071.LocalDataSource>(),
        ));
    gh.lazySingleton<_i674.UserForgetPasswordUseCase>(
        () => _i674.UserForgetPasswordUseCase(gh<_i594.AuthRepository>()));
    gh.lazySingleton<_i391.UserLoginUseCase>(
        () => _i391.UserLoginUseCase(gh<_i594.AuthRepository>()));
    gh.lazySingleton<_i1035.UserRegisterUseCase>(
        () => _i1035.UserRegisterUseCase(gh<_i594.AuthRepository>()));
    gh.lazySingleton<_i750.SearchRepository>(() => _i538.SearchRepositoryImpl(
          gh<_i325.SearchDataSource>(),
          gh<_i1071.LocalDataSource>(),
        ));
    gh.lazySingleton<_i702.GetPopularTvShowsUseCase>(
        () => _i702.GetPopularTvShowsUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i848.GetRecommendedTvShowsUseCase>(() =>
        _i848.GetRecommendedTvShowsUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i974.GetSimilarTvShowsUseCase>(
        () => _i974.GetSimilarTvShowsUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i788.GetTopRatedTvShowsUseCase>(
        () => _i788.GetTopRatedTvShowsUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i1051.GetTvShowsAiringThisWeekUseCase>(() =>
        _i1051.GetTvShowsAiringThisWeekUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i1069.GetTvShowsAiringTodayUseCase>(() =>
        _i1069.GetTvShowsAiringTodayUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i514.GetTvShowDetailsUseCase>(
        () => _i514.GetTvShowDetailsUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i751.PlayTvShowVideoUseCase>(
        () => _i751.PlayTvShowVideoUseCase(gh<_i884.TvShowsRepository>()));
    gh.lazySingleton<_i859.CheckUserLoginSessionUseCase>(
        () => _i859.CheckUserLoginSessionUseCase(gh<_i741.LocalRepository>()));
    gh.lazySingleton<_i951.GetSessionIdUseCase>(
        () => _i951.GetSessionIdUseCase(gh<_i741.LocalRepository>()));
    gh.factory<_i627.SeeAllTvShowsBloc>(() => _i627.SeeAllTvShowsBloc(
          gh<_i848.GetRecommendedTvShowsUseCase>(),
          gh<_i974.GetSimilarTvShowsUseCase>(),
          gh<_i1069.GetTvShowsAiringTodayUseCase>(),
          gh<_i702.GetPopularTvShowsUseCase>(),
          gh<_i788.GetTopRatedTvShowsUseCase>(),
        ));
    gh.lazySingleton<_i340.GetSearchSessionIdUseCase>(
        () => _i340.GetSearchSessionIdUseCase(gh<_i750.SearchRepository>()));
    gh.lazySingleton<_i680.SearchForMovieUseCase>(
        () => _i680.SearchForMovieUseCase(gh<_i750.SearchRepository>()));
    gh.lazySingleton<_i1025.SearchForPersonUseCase>(
        () => _i1025.SearchForPersonUseCase(gh<_i750.SearchRepository>()));
    gh.lazySingleton<_i838.SearchForTvShowUseCase>(
        () => _i838.SearchForTvShowUseCase(gh<_i750.SearchRepository>()));
    gh.factory<_i723.WatchListBloc>(() => _i723.WatchListBloc(
          gh<_i419.GetMoviesWatchListUseCase>(),
          gh<_i485.AddOrRemoveMovieFromWatchListUseCase>(),
          gh<_i289.GetTvShowsWatchListUseCase>(),
          gh<_i1029.AddOrRemoveTvShowFromWatchListUseCase>(),
          gh<_i538.GetMoviesWatchListIdsSetUseCase>(),
          gh<_i959.GetTvShowsWatchListIdsSetUseCase>(),
        ));
    gh.lazySingleton<_i321.AccountLogoutUseCase>(
        () => _i321.AccountLogoutUseCase(gh<_i451.AccountRepository>()));
    gh.lazySingleton<_i435.GetAccountDetailsUseCase>(
        () => _i435.GetAccountDetailsUseCase(gh<_i451.AccountRepository>()));
    gh.factory<_i774.LoginCubit>(() => _i774.LoginCubit(
          userRegisterUseCase: gh<_i1035.UserRegisterUseCase>(),
          userForgetPasswordUseCase: gh<_i674.UserForgetPasswordUseCase>(),
          userLoginUseCase: gh<_i391.UserLoginUseCase>(),
        ));
    gh.factory<_i894.AccountCubit>(() => _i894.AccountCubit(
          gh<_i435.GetAccountDetailsUseCase>(),
          gh<_i321.AccountLogoutUseCase>(),
          gh<_i951.GetSessionIdUseCase>(),
        ));
    gh.factory<_i623.TvShowsCubit>(() => _i623.TvShowsCubit(
          gh<_i1069.GetTvShowsAiringTodayUseCase>(),
          gh<_i1051.GetTvShowsAiringThisWeekUseCase>(),
          gh<_i702.GetPopularTvShowsUseCase>(),
          gh<_i788.GetTopRatedTvShowsUseCase>(),
        ));
    gh.factory<_i207.TvShowDetailsCubit>(() => _i207.TvShowDetailsCubit(
          gh<_i514.GetTvShowDetailsUseCase>(),
          gh<_i751.PlayTvShowVideoUseCase>(),
        ));
    gh.factory<_i304.TokenCubit>(() => _i304.TokenCubit(
          gh<_i859.CheckUserLoginSessionUseCase>(),
          gh<_i1035.UserRegisterUseCase>(),
        ));
    gh.factory<_i392.SearchBloc>(() => _i392.SearchBloc(
          gh<_i340.GetSearchSessionIdUseCase>(),
          gh<_i838.SearchForTvShowUseCase>(),
          gh<_i680.SearchForMovieUseCase>(),
          gh<_i1025.SearchForPersonUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i2.RegisterModule {}
