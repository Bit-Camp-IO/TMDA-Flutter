import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/account/data/models/account_model.dart';
import 'package:tmda/features/account/data/models/account_states_model.dart';
import 'package:tmda/features/account/data/models/watchlist_movie_model.dart';
import 'package:tmda/features/account/data/models/watchlist_tv_show_model.dart';

abstract class AccountDataSource{
  Future<AccountModel> getAccountDetails(String sessionId);
  Future<List<WatchListMovieModel>> getMoviesWatchList(String sessionId);
  Future<List<WatchListTvShowModel>> getTvShowsWatchList(String sessionId);
  Future<List<WatchListMovieModel>> getAllMoviesWatchList({required String sessionId, required int pageNumber});
  Future<List<WatchListTvShowModel>> getAllTvShowsWatchList({required String sessionId, required int pageNumber});
  Future<AccountStatesModel> addOrRemoveTvShowFromAccountWatchList({required int contentId, required String sessionId, required bool isInWatchList});
  Future<AccountStatesModel> addOrRemoveMovieFromAccountWatchList({required int contentId, required String sessionId, required bool isInWatchList});
  Future<AccountStatesModel> getTvShowWatchListStates({required int contentId,required String sessionId});
  Future<AccountStatesModel> getMovieWatchListStates({required int contentId,required String sessionId});
  Future<void> accountLogOut({required String sessionId});
}

@LazySingleton(as: AccountDataSource)
class AccountDataSourceImpl extends AccountDataSource{
  final ApiConsumer apiConsumer;
  AccountDataSourceImpl(this.apiConsumer);

  @override
  Future<AccountModel> getAccountDetails(String sessionId) async{
    final accountDetails = await apiConsumer.get(ApiConstants.accountEndPoint, queryParameters: {
      'session_id' : sessionId,
    });
    return AccountModel.fromJson(accountDetails);
  }

  @override
  Future<List<WatchListMovieModel>> getMoviesWatchList(String sessionId) async{
    final listOfMovies =
        await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}', queryParameters: {
          'session_id' : sessionId,
        });
    return List<WatchListMovieModel>.from(
      (listOfMovies['results'] as List).map(
            (watchlistMovie) => WatchListMovieModel.fromJson(watchlistMovie),
      ),
    );
  }

  @override
  Future<List<WatchListTvShowModel>> getTvShowsWatchList(String sessionId) async{
    final listOfTvShows =
        await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}', queryParameters: {
      'session_id' : sessionId,
    });
    return List<WatchListTvShowModel>.from(
      (listOfTvShows['results'] as List).map(
            (watchlistTvShow) => WatchListMovieModel.fromJson(watchlistTvShow),
      ),
    );
  }

  @override
  Future<List<WatchListMovieModel>> getAllMoviesWatchList({required String sessionId, required int pageNumber}) async{
    final listOfMovies = await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}',  queryParameters: {
      'page': pageNumber,
      'session_id' : sessionId,
     },
    );
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<WatchListMovieModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return WatchListMovieModel.fromJson(movie);
    });
  }

  @override
  Future<List<WatchListTvShowModel>> getAllTvShowsWatchList({required String sessionId, required int pageNumber}) async{
    final listOfTvShows = await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}',  queryParameters: {
      'page': pageNumber,
      'session_id' : sessionId,
    },
    );
    final tvShowsIds = listOfTvShows['results'].map((movie) => movie['id']).toList();
    final tvShowsStatuses = await Future.wait(tvShowsIds.map((id) => apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<WatchListTvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status' : tvShowsStatuses[index]});
      return WatchListTvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<AccountStatesModel> addOrRemoveTvShowFromAccountWatchList({required int contentId, required String sessionId, required bool isInWatchList}) async{
    final response = await apiConsumer.post(ApiConstants.addOrRemoveFromWatchListEndPoint, queryParameters: {
      'session_id': sessionId},
      body: {
        'media_type': 'tv',
        "media_id": contentId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      return AccountStatesModel(inWatchList: isInWatchList);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }
  @override
  Future<AccountStatesModel> addOrRemoveMovieFromAccountWatchList({required int contentId, required String sessionId, required bool isInWatchList}) async{
    final response = await apiConsumer.post(ApiConstants.addOrRemoveFromWatchListEndPoint, queryParameters: {
      'session_id': sessionId},
      body: {
        'media_type': 'movie',
        "media_id": contentId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      return AccountStatesModel(inWatchList: isInWatchList);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  @override
  Future<AccountStatesModel> getTvShowWatchListStates({required int contentId, required String sessionId}) async{
    final Map<String, dynamic> watchListStates = await apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$contentId${ApiConstants.accountStatusPath}', queryParameters: {
            'session_id' : sessionId,
    });
    watchListStates.addAll({'content_id' : contentId});
    return AccountStatesModel.fromJson(watchListStates);
  }

  @override
  Future<AccountStatesModel> getMovieWatchListStates({required int contentId, required String sessionId}) async{
    final Map<String, dynamic> watchListStates = await apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$contentId${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    });
    watchListStates.addAll({'content_id' : contentId});
    return AccountStatesModel.fromJson(watchListStates);
  }

  @override
  Future<void> accountLogOut({required String sessionId}) async{
    final response = await apiConsumer.delete(ApiConstants.accountLogoutEndPoint, body: {
       'session_id': sessionId
      },
    );
    if (response['success'] == false) {
      throw ServerException('${response['status_message']}');
    }
  }
}