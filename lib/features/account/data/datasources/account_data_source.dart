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
  Future<AccountStatesModel> removeTvShowFromWatchList({required int contentId, required String sessionId});
  Future<AccountStatesModel> removeMovieFromWatchList({required int contentId, required String sessionId});
  Future<AccountStatesModel> getTvShowWatchListStates({required int contentId,required String sessionId});
  Future<AccountStatesModel> getMovieWatchListStates({required int contentId,required String sessionId});
  Future<void> accountLogOut({required String sessionId});
}

@LazySingleton(as: AccountDataSource)
class AccountDataSourceImpl extends AccountDataSource{
  final ApiConsumer _apiConsumer;
  AccountDataSourceImpl(this._apiConsumer);

  @override
  Future<AccountModel> getAccountDetails(String sessionId) async{
    final accountDetails = await _apiConsumer.get(ApiConstants.accountEndPoint, queryParameters: {
      'session_id' : sessionId,
    });
    return AccountModel.fromJson(accountDetails);
  }

  @override
  Future<List<WatchListMovieModel>> getMoviesWatchList(String sessionId) async{
    final listOfMovies =
        await _apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}', queryParameters: {
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
        await _apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}', queryParameters: {
      'session_id' : sessionId,
    });
    return List<WatchListTvShowModel>.from(
      (listOfTvShows['results'] as List).map(
            (watchlistTvShow) => WatchListTvShowModel.fromJson(watchlistTvShow),
      ),
    );
  }

  @override
  Future<List<WatchListMovieModel>> getAllMoviesWatchList({required String sessionId, required int pageNumber}) async{
    final listOfMovies = await _apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}',  queryParameters: {
      'page': pageNumber,
      'session_id' : sessionId,
     },
    );
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => _apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
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
    final listOfTvShows = await _apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}',  queryParameters: {
      'page': pageNumber,
      'session_id' : sessionId,
    },
    );
    final tvShowsIds = listOfTvShows['results'].map((movie) => movie['id']).toList();
    final tvShowsStatuses = await Future.wait(tvShowsIds.map((id) => _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<WatchListTvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status' : tvShowsStatuses[index]});
      return WatchListTvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<AccountStatesModel> removeTvShowFromWatchList({required int contentId, required String sessionId}) async{
    final response = await _apiConsumer.post(ApiConstants.addOrRemoveFromWatchListEndPoint, queryParameters: {
      'session_id': sessionId},
      body: {
        'media_type': 'tv',
        "media_id": contentId,
        "watchlist": false
      },
    );
    if (response['success'] == true) {
      return AccountStatesModel(inWatchList: false, contentId: contentId);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }
  @override
  Future<AccountStatesModel> removeMovieFromWatchList({required int contentId, required String sessionId}) async{
    final response = await _apiConsumer.post(ApiConstants.addOrRemoveFromWatchListEndPoint, queryParameters: {
      'session_id': sessionId},
      body: {
        'media_type': 'movie',
        "media_id": contentId,
        "watchlist": false
      },
    );
    if (response['success'] == true) {
      return  AccountStatesModel(inWatchList: false, contentId: contentId);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  @override
  Future<AccountStatesModel> getTvShowWatchListStates({required int contentId, required String sessionId}) async{
    final Map<String, dynamic> watchListStates = await _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$contentId${ApiConstants.accountStatusPath}', queryParameters: {
            'session_id' : sessionId,
    });
    watchListStates.addAll({'content_id' : contentId});
    return AccountStatesModel.fromJson(watchListStates);
  }

  @override
  Future<AccountStatesModel> getMovieWatchListStates({required int contentId, required String sessionId}) async{
    final Map<String, dynamic> watchListStates = await _apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$contentId${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    });
    watchListStates.addAll({'content_id' : contentId});
    return AccountStatesModel.fromJson(watchListStates);
  }

  @override
  Future<void> accountLogOut({required String sessionId}) async{
    final response = await _apiConsumer.delete(ApiConstants.accountLogoutEndPoint, body: {
       'session_id': sessionId
      },
    );
    if (response['success'] == false) {
      throw ServerException('${response['status_message']}');
    }
  }
}