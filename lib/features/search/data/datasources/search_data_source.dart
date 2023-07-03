import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
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
}

@LazySingleton(as: SearchDataSource)
class SearchDataSourceIml extends SearchDataSource {
  final ApiConsumer _apiConsumer;

  SearchDataSourceIml(this._apiConsumer);

  @override
  Future<List<MovieSearchModel>> searchForMovie(
      {required String movieName, required String sessionId, required int pageNumber}) async {
    final listOfMovies = await _apiConsumer.get(
      ApiConstants.movieSearch, queryParameters: {
      'query': movieName,
      'page': pageNumber,
      'include_adult': false,
    },
    );
    return List<MovieSearchModel>.from((listOfMovies['results']).map((movies) =>
        MovieSearchModel.fromJson(movies)));
  }

  @override
  Future<List<SearchTvShowModel>> searchForTvShow(
      {required String tvShowName, required String sessionId, required int pageNumber}) async {
    final listOfTvShows = await _apiConsumer.get(
      ApiConstants.tvShowSearch, queryParameters: {
      'query': tvShowName,
      'page': pageNumber,
      'include_adult': false,
    },
    );
    return List<SearchTvShowModel>.from(
        (listOfTvShows['results']).map((tvShows) =>
            SearchTvShowModel.fromJson(tvShows)));
  }

  @override
  Future<List<PersonSearchModel>> searchForPerson(
      {required String personName, required int pageNumber}) async {
    final listOfPersons = await _apiConsumer.get(
      ApiConstants.personSearch, queryParameters: {
      'query': personName,
      'page': pageNumber,
      'include_adult': false,
    },
    );
    return List<PersonSearchModel>.from(
        (listOfPersons['results']).map((person) =>
            PersonSearchModel.fromJson(person)));
  }
}