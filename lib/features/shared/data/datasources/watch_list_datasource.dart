import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/shared/data/models/movies_model.dart';
import 'package:tmda/features/shared/data/models/tv_show_model.dart';

abstract class WatchListDataSource {
  Future<List<MovieModel>> getMoviesWatchList({int? pageNumber});

  Future<List<TvShowModel>> getTvShowsWatchList({int? pageNumber});

  Future<Set<int>> getMoviesWatchListIdsSet();

  Future<Set<int>> getTvShowsWatchListIdsSet();

  Future<MovieModel> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
  });

  Future<TvShowModel> addOrRemoveTvShowFromWatchList({
    required int tvShowId,
    required bool isInWatchList,
  });
}

@LazySingleton(as: WatchListDataSource)
class WatchListDataSourceImpl extends WatchListDataSource {
  final ApiConsumer _apiConsumer;

  Set<int> moviesWatchListIds = {};
  Set<int> tvShowsWatchListIds = {};
  int _moviesWatchListPage = 1;
  int _tvShowsWatchListPage = 1;

  WatchListDataSourceImpl(
      @Named(ApiConstants.authenticatedConsumer) this._apiConsumer);

  @override
  Future<List<MovieModel>> getMoviesWatchList({int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}',
      queryParameters: {'page': pageNumber ?? 1},
    );
    return List<MovieModel>.from(
      (response['results'] as List).map(
        (watchlistMovie) => MovieModel.fromJson(watchlistMovie),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getTvShowsWatchList({int? pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}',
      queryParameters: {'page': pageNumber ?? 1},
    );
    return List<TvShowModel>.from(
      (response['results'] as List).map(
        (watchlistTvShow) => TvShowModel.fromJson(watchlistTvShow),
      ),
    );
  }

  @override
  Future<Set<int>> getMoviesWatchListIdsSet() async {
    while (true) {
      final Map<String, dynamic> response = await _apiConsumer.get(
        '${ApiConstants.accountEndPoint}${ApiConstants.accountMoviesWatchListPath}',
        queryParameters: {'page': _moviesWatchListPage},
      );
      final List watchList = List.from(response['results']);
      moviesWatchListIds = {...moviesWatchListIds, ...watchList.map((jsonData) => jsonData['id'] as int)};
      if (watchList.isNotEmpty && watchList.length == 20) {
        _moviesWatchListPage++;
      } else {
        break;
      }
    }
    return moviesWatchListIds;
  }

  @override
  Future<Set<int>> getTvShowsWatchListIdsSet() async {
    while(true){
      final Map<String, dynamic> response = await _apiConsumer.get(
        '${ApiConstants.accountEndPoint}${ApiConstants.accountTvWatchListPath}',
        queryParameters: {'page': _tvShowsWatchListPage},
      );
      final List watchList = List.from(response['results']);
      tvShowsWatchListIds = {...tvShowsWatchListIds, ...watchList.map((jsonData) => jsonData['id'] as int)};
      if (watchList.isNotEmpty && watchList.length == 20) {
        _tvShowsWatchListPage++;
      } else {
        break;
      }
    }
    return tvShowsWatchListIds;
  }

  @override
  Future<MovieModel> addOrRemoveMovieFromWatchList({
    required int movieId,
    required bool isInWatchList,
  }) async {
    final Map<String, dynamic> response = await _apiConsumer.post(
      ApiConstants.addOrRemoveFromWatchListEndPoint,
      body: {
        'media_type': 'movie',
        "media_id": movieId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      final MovieModel movie = await _getMovieDetails(movieId: movieId);
      return movie;
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  @override
  Future<TvShowModel> addOrRemoveTvShowFromWatchList({required int tvShowId, required bool isInWatchList}) async {
    final Map<String, dynamic> response = await _apiConsumer.post(ApiConstants.addOrRemoveFromWatchListEndPoint,
      body: {
        'media_type': 'tv',
        "media_id": tvShowId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      final TvShowModel tvShow = await _getTvShowDetails(tvShowId: tvShowId);
      return tvShow;
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  Future<MovieModel> _getMovieDetails({required int movieId}) async {
    final Map<String, dynamic> response =
        await _apiConsumer.get('${ApiConstants.movieDetailsEndPoint}$movieId');
    return MovieModel.fromJson(response);
  }

  Future<TvShowModel> _getTvShowDetails({required int tvShowId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId',
    );
    return TvShowModel.fromJson(response);
  }
}
