import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/search/data/models/search_content_states_model.dart';
import 'package:tmda/features/search/data/models/movie_search_model.dart';
import 'package:tmda/features/search/data/models/person_search_model.dart';
import 'package:tmda/features/search/data/models/tv_show_search_model.dart';

abstract class SearchDataSource {
  Future<List<MovieSearchModel>> searchForMovie({
    required String movieName,
    required String sessionId,
    required int pageNumber,
  });

  Future<List<SearchTvShowModel>> searchForTvShow({
    required String tvShowName,
    required String sessionId,
    required int pageNumber,
  });

  Future<List<PersonSearchModel>> searchForPerson({
    required String personName,
    required int pageNumber,
   });
  Future<SearchContentStatesModel> addOrRemoveContentFromWatchList({required int contentId, required String sessionId, required String contentType, required bool isInWatchList});
  Future<SearchContentStatesModel> checkForMovieState({required int movieId, required String sessionId});
  Future<SearchContentStatesModel> checkForTvShowState({required int tvShowId, required String sessionId});
}

@LazySingleton(as: SearchDataSource)
class SearchDataSourceIml extends SearchDataSource {
  final ApiConsumer _apiConsumer;

  SearchDataSourceIml(this._apiConsumer);
  @override
  Future<List<MovieSearchModel>> searchForMovie({required String movieName, required String sessionId, required int pageNumber}) async{
    final listOfMovies = await _apiConsumer.get(ApiConstants.movieSearch,  queryParameters: {
      'query': movieName,
      'page': pageNumber,
      'include_adult': false,
    },
    );
    final movieIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final movieStatuses = await Future.wait(movieIds.map((id) => _apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<MovieSearchModel>.generate(movieIds.length, (index) {
      final Map<String, dynamic> movie = listOfMovies['results'][index];
      movie.addAll({'account_status' : movieStatuses[index]});
      return MovieSearchModel.fromJson(movie);
    });
  }

  @override
  Future<List<SearchTvShowModel>> searchForTvShow({required String tvShowName, required String sessionId, required int pageNumber}) async{
    final listOfMovies = await _apiConsumer.get(ApiConstants.tvShowSearch,  queryParameters: {
      'query': tvShowName,
      'page': pageNumber,
      'include_adult': false,
    },
    );
    final tvShowIds = listOfMovies['results'].map((movie) => movie['id']).toList();
    final tvShowsStatuses = await Future.wait(tvShowIds.map((id) => _apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$id${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    })).toList().cast<Future<dynamic>>());
    return List<SearchTvShowModel>.generate(tvShowIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfMovies['results'][index];
      tvShow.addAll({'account_status' : tvShowsStatuses[index]});
      return SearchTvShowModel.fromJson(tvShow);
    });
  }
  @override
  Future<List<PersonSearchModel>> searchForPerson({required String personName, required int pageNumber}) async{
    final listOfPersons = await _apiConsumer.get(ApiConstants.tvShowSearch,  queryParameters: {
      'query': personName,
      'page': pageNumber,
      'include_adult': false,
    },
    );
    return List<PersonSearchModel>.from((listOfPersons).map((person) => PersonSearchModel.fromJson(person)));
  }

  @override
  Future<SearchContentStatesModel> addOrRemoveContentFromWatchList({required int contentId, required String sessionId, required String contentType, required bool isInWatchList}) async{
    final response = await _apiConsumer.post(
      ApiConstants.addOrRemoveFromWatchListEndPoint,
      queryParameters: {'session_id': sessionId},
      body: {
        'media_type': contentType,
        "media_id": contentId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      return SearchContentStatesModel(inWatchList: isInWatchList);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  @override
  Future<SearchContentStatesModel> checkForMovieState({required int movieId, required String sessionId}) async{
    final Map<String, dynamic> movieStates = await _apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$movieId${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    });
    movieStates.addAll({'content_id' : movieId});
    return SearchContentStatesModel.fromJson(movieStates);
  }

  @override
  Future<SearchContentStatesModel> checkForTvShowState({required int tvShowId, required String sessionId}) async{
    final Map<String, dynamic> tvShowStates = await _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.accountStatusPath}', queryParameters: {
      'session_id' : sessionId,
    });
    tvShowStates.addAll({'content_id' : tvShowId});
    return SearchContentStatesModel.fromJson(tvShowStates);
  }
}
