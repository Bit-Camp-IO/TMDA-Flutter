import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/core/util/enums.dart';
import 'package:tmda/features/account/data/models/account_model.dart';
import 'package:tmda/features/account/data/models/account_states_model.dart';
import 'package:tmda/features/account/data/models/account_watchlist_movie_model.dart';
import 'package:tmda/features/account/data/models/account_watchlist_tv_show_model.dart';

abstract class AccountDataSource{
  Future<AccountModel> getAccountDetails(String sessionId);
  Future<List<AccountWatchListMovieModel>> getMoviesWatchList(String sessionId);
  Future<List<AccountWatchListTvShowModel>> getTvShowsWatchList(String sessionId);
  Future<List<AccountWatchListMovieModel>> getAllMoviesWatchList({required String sessionId, required int pageNumber});
  Future<List<AccountWatchListTvShowModel>> getAllTvShowsWatchList({required String sessionId, required int pageNumber});
  Future<AccountStatesModel> addOrRemoveFromWatchList({required int contentId, required String sessionId, required bool isInWatchList, required MediaType mediaType});
  Future<AccountStatesModel> getWatchListStates({required int contentId,required String sessionId, required MediaType mediaType});
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
  Future<List<AccountWatchListMovieModel>> getMoviesWatchList(String sessionId) async{
    final listOfMovies =
        await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}', queryParameters: {
          'session_id' : sessionId,
        });
    return List<AccountWatchListMovieModel>.from(
      (listOfMovies['results'] as List).map(
            (watchlistMovie) => AccountWatchListMovieModel.fromJson(watchlistMovie),
      ),
    );
  }

  @override
  Future<List<AccountWatchListTvShowModel>> getTvShowsWatchList(String sessionId) async{
    final listOfTvShows =
        await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}', queryParameters: {
      'session_id' : sessionId,
    });
    return List<AccountWatchListTvShowModel>.from(
      (listOfTvShows['results'] as List).map(
            (watchlistTvShow) => AccountWatchListMovieModel.fromJson(watchlistTvShow),
      ),
    );
  }

  @override
  Future<List<AccountWatchListMovieModel>> getAllMoviesWatchList({required String sessionId, required int pageNumber}) async{
    final listOfMovies = await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}',  queryParameters: {
      'page': pageNumber,
      'session_id' : sessionId,
     },
    );
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<AccountWatchListMovieModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return AccountWatchListMovieModel.fromJson(movie);
    });
  }

  @override
  Future<List<AccountWatchListTvShowModel>> getAllTvShowsWatchList({required String sessionId, required int pageNumber}) async{
    final listOfTvShows = await apiConsumer.get('${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}',  queryParameters: {
      'page': pageNumber,
      'session_id' : sessionId,
    },
    );
    final tvShowsIds = listOfTvShows['results'].map((movie) => movie['id']).toList();
    final tvShowsStatuses = await Future.wait(tvShowsIds.map((id) => apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<AccountWatchListTvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status' : tvShowsStatuses[index]});
      return AccountWatchListTvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<AccountStatesModel> addOrRemoveFromWatchList({required int contentId, required String sessionId, required bool isInWatchList, required MediaType mediaType}) async{
    final response = await apiConsumer.post(ApiConstants.addOrRemoveFromWatchListEndPoint, queryParameters: {
      'session_id': sessionId},
      body: {
        'media_type': mediaType.name,
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
  Future<AccountStatesModel> getWatchListStates({required int contentId, required String sessionId, required MediaType mediaType}) async{
    if(mediaType == MediaType.movie){
        final Map<String, dynamic> watchListStates = await apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$contentId${ApiConstants.accountStatusPath}', queryParameters: {
          'session_id' : sessionId,
        });
        watchListStates.addAll({'content_id' : contentId});
        return AccountStatesModel.fromJson(watchListStates);
      }else{
          final Map<String, dynamic> watchListStates = await apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$contentId${ApiConstants.accountStatusPath}', queryParameters: {
            'session_id' : sessionId,
          });
          watchListStates.addAll({'content_id' : contentId});
          return AccountStatesModel.fromJson(watchListStates);
    }
  }
}