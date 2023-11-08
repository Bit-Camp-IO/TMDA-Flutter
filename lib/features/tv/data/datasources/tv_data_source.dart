import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/tv/data/models/tv_show_account_status_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_cast_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_details_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_reviews_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class TvDataSource {
  Future<List<TvShowModel>> getTvShowsAiringToday(int pageNumber);

  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber);

  Future<List<TvShowModel>> getPopularTvShows(int pageNumber);

  Future<List<TvShowModel>> getTopRatedTopRatedTvShows(int pageNumber);

  Future<TvShowDetailsModel> getTvShowDetails({
    required int tvShowId,
  });

  Future<TvShowCastModel> getTvShowCast(int tvShowId);

  Future<TvShowReviewsModel> getTvShowReviews(int tvShowId);

  Future<void> playTvShowVideo(String youtubeVideoKey);

  Future<List<TvShowModel>> getSimilarTvShows({
    required int tvShowId,
  });

  Future<List<TvShowModel>> getRecommendedTvShows({
    required int tvShowId,
  });

  Future<TvShowAccountStatesModel> addOrRemoveMovieFromWatchList({
    required int tvShowId,
    required bool isInWatchList,
  });

  Future<List<TvShowModel>> getAllAiringTodayTvShows({required int pageNumber});

  Future<List<TvShowModel>> getAllPopularTvShows({required int pageNumber});

  Future<List<TvShowModel>> getAllTopRatedTvShows({required int pageNumber});

  Future<List<TvShowModel>> getAllSimilarTvShows({
    required int tvShowId,
    required int pageNumber,
  });

  Future<List<TvShowModel>> getAllRecommendedTvShows({
    required int tvShowId,
    required int pageNumber,
  });

  Future<TvShowAccountStatesModel> getTvShowStates({
    required int tvShowId,
  });
}

@LazySingleton(as: TvDataSource)
class TvDataSourceImpl extends TvDataSource {
  final ApiConsumer _apiConsumer;

  TvDataSourceImpl(@Named(ApiConstants.authenticatedConsumer) this._apiConsumer);


  @override
  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber) async {
    final response = await _apiConsumer.get(
      ApiConstants.tvAiringThisWeekEndPoint,
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      response['results'].map(
        (jsonData) => TvShowModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getPopularTvShows(int pageNumber) async {
    final response = await _apiConsumer.get(
      ApiConstants.popularTvShowsEndPoint,
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      response['results'].map(
        (jsonData) => TvShowModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getTopRatedTopRatedTvShows(int pageNumber) async {
    final response = await _apiConsumer.get(
      ApiConstants.topRatedTvShowsEndPoint,
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      response['results'].map(
        (jsonData) => TvShowModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getTvShowsAiringToday(int pageNumber) async {
    final response = await _apiConsumer.get(
      ApiConstants.tvAiringTodayEndPoint,
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      response['results'].map(
        (jsonData) => TvShowModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getRecommendedTvShows({
    required int tvShowId,
  }) async {
    final response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.recommendationsPath}',
    );
    return List<TvShowModel>.from((response['results'] as List)
        .map((jsonData) => TvShowModel.fromJson(jsonData)));
  }

  @override
  Future<List<TvShowModel>> getSimilarTvShows({
    required int tvShowId,
  }) async {
    final response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.similarPath}',
    );
    return List<TvShowModel>.from(
      response['results'].map(
        (jsonData) => TvShowModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<TvShowCastModel> getTvShowCast(int tvShowId) async {
    final response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.castPath}',
    );
    return TvShowCastModel.fromJson(response);
  }

  @override
  Future<TvShowDetailsModel> getTvShowDetails({required int tvShowId}) async {
    final response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId',
      queryParameters: {
        'append_to_response': ApiConstants.endPointsAppendedToResponse,
        'page': 1,
      },
    );
    return TvShowDetailsModel.fromJson(response);
  }

  @override
  Future<TvShowReviewsModel> getTvShowReviews(int tvShowId) async {
    final response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.reviewsPath}',
    );
    return TvShowReviewsModel.fromJson(response);
  }


  @override
  Future<TvShowAccountStatesModel> addOrRemoveMovieFromWatchList({required int tvShowId, required bool isInWatchList}) async {
    final response = await _apiConsumer.post(
      ApiConstants.addOrRemoveFromWatchListEndPoint,
      body: {
        'media_type': 'tv',
        "media_id": tvShowId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      return TvShowAccountStatesModel(isInWatchList: isInWatchList);
    } else {
      throw ServerException('${response['status_message']}');
    }
  }

  @override
  Future<void> playTvShowVideo(String youtubeVideoKey) async {
    final Uri url = Uri.parse('${ApiConstants.baseYoutubeUrl}$youtubeVideoKey');
    await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw LaunchUrlException('Could not launch $url');
    }
  }

  @override
  Future<List<TvShowModel>> getAllAiringTodayTvShows({required int pageNumber}) async {
    final listOfTvShows = await _apiConsumer.get(
      ApiConstants.tvAiringTodayEndPoint,
      queryParameters: {'page': pageNumber},
    );
    final tvShowsIds =
        listOfTvShows['results'].map((movie) => movie['id']).toList();
    final tvShowsStates = await Future.wait(tvShowsIds
        .map((id) => _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}'))
        .toList()
        .cast<Future<dynamic>>());
    return List<TvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status': tvShowsStates[index]});
      return TvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<List<TvShowModel>> getAllPopularTvShows({required int pageNumber}) async {
    final listOfTvShows = await _apiConsumer.get(
      ApiConstants.popularTvShowsEndPoint,
      queryParameters: {'page': pageNumber},
    );
    final tvShowsIds =
        listOfTvShows['results'].map((movie) => movie['id']).toList();
    final tvShowsStates = await Future.wait(tvShowsIds
        .map((id) => _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}'))
        .toList()
        .cast<Future<dynamic>>());
    return List<TvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status': tvShowsStates[index]});
      return TvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<List<TvShowModel>> getAllTopRatedTvShows({required int pageNumber}) async {
    final listOfTvShows = await _apiConsumer.get(
      ApiConstants.topRatedTvShowsEndPoint,
      queryParameters: {'page': pageNumber},
    );
    final tvShowsIds =
        listOfTvShows['results'].map((movie) => movie['id']).toList();
    final tvShowsStates = await Future.wait(tvShowsIds
        .map((id) => _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}'))
        .toList()
        .cast<Future<dynamic>>());
    return List<TvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status': tvShowsStates[index]});
      return TvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<List<TvShowModel>> getAllRecommendedTvShows({required int tvShowId, required int pageNumber}) async {
    final listOfTvShows = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.recommendationsPath}',
      queryParameters: {'page': pageNumber},
    );
    final tvShowsIds =
        listOfTvShows['results'].map((tvShow) => tvShow['id']).toList();
    final tvShowsStates = await Future.wait(tvShowsIds
        .map((id) => _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}'))
        .toList()
        .cast<Future<dynamic>>());
    return List<TvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status': tvShowsStates[index]});
      return TvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<List<TvShowModel>> getAllSimilarTvShows({required int tvShowId, required int pageNumber}) async {
    final listOfTvShows = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.similarPath}',
      queryParameters: {'page': pageNumber},
    );
    final tvShowsIds =
        listOfTvShows['results'].map((tvShow) => tvShow['id']).toList();
    final tvShowsStates = await Future.wait(tvShowsIds
        .map((id) => _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$id${ApiConstants.accountStatusPath}'))
        .toList()
        .cast<Future<dynamic>>());
    return List<TvShowModel>.generate(tvShowsIds.length, (index) {
      final Map<String, dynamic> tvShow = listOfTvShows['results'][index];
      tvShow.addAll({'account_status': tvShowsStates[index]});
      return TvShowModel.fromJson(tvShow);
    });
  }

  @override
  Future<TvShowAccountStatesModel> getTvShowStates({required int tvShowId}) async {
    final Map<String, dynamic> movieStates = await _apiConsumer.get('${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.accountStatusPath}');
    movieStates.addAll({'tv_show_id': tvShowId});
    return TvShowAccountStatesModel.fromJson(movieStates);
  }
}
