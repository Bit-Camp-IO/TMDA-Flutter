import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/tv/data/models/tv_details/season_episode_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_account_status_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_cast_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_details_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_reviews_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_video_model.dart';
import 'package:tmda/features/tv/data/models/tv_show/tv_show_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class TvDataSource {
  Future<List<TvShowModel>> getTvShowsAiringToday(int pageNumber);

  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber);

  Future<List<TvShowModel>> getPopularTvShows(int pageNumber);

  Future<List<TvShowModel>> getTopRatedTopRatedTvShows(int pageNumber);

  Future<TvShowDetailsModel> getTvShowDetails({
    required int tvShowId,
    required String sessionKey,
  });

  Future<TvShowCastModel> getTvShowCast(int tvShowId);

  Future<TvShowReviewsModel> getTvShowReviews(int tvShowId);

  Future<void> playTvShowVideo(String youtubeVideoKey);

  Future<List<TvShowModel>> getSimilarTvShows({
    required int tvShowId,
    required int pageNumber,
  });

  Future<List<TvShowModel>> getRecommendedTvShows({
    required int tvShowId,
    required int pageNumber,
  });

  Future<List<SeasonEpisodeModel>> getSeasonEpisodes({
    required int tvShowId,
    required int seasonNumber,
  });

  Future<TvShowAccountStatusModel> addOrRemoveMovieFromWatchList({
    required int tvShowId,
    required bool isInWatchList,
    required String sessionId,
  });

  Future<TvShowVideoModel> getEpisodeVideo(
      {required int tvShowId,
      required seasonNumber,
      required int episodeNumber});
}

@LazySingleton(as: TvDataSource)
class TvDataSourceImpl extends TvDataSource {
  final ApiConsumer apiConsumer;

  TvDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber) async {
    final response = await apiConsumer.get(
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
    final response = await apiConsumer.get(
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
    final response = await apiConsumer.get(
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
    final response = await apiConsumer.get(
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
    required int pageNumber,
  }) async {
    final response = await apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.recommendationsPath}',
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from((response['results'] as List)
        .map((jsonData) => TvShowModel.fromJson(jsonData)));
  }

  @override
  Future<List<TvShowModel>> getSimilarTvShows({
    required int tvShowId,
    required int pageNumber,
  }) async {
    final response = await apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.similarPath}',
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      response['results'].map(
        (jsonData) => TvShowModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<TvShowCastModel> getTvShowCast(int tvShowId) async {
    final response = await apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.castPath}',
    );
    return TvShowCastModel.fromJson(response);
  }

  @override
  Future<TvShowDetailsModel> getTvShowDetails(
      {required int tvShowId, required String sessionKey}) async {
    final response = await apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId',
      queryParameters: {
        'session_id': sessionKey,
        'append_to_response': ApiConstants.endPointsAppendedToResponse,
      },
    );
    return TvShowDetailsModel.fromJson(response);
  }

  @override
  Future<TvShowReviewsModel> getTvShowReviews(int tvShowId) async {
    final response = await apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.reviewsPath}',
    );
    return TvShowReviewsModel.fromJson(response);
  }

  @override
  Future<List<SeasonEpisodeModel>> getSeasonEpisodes(
      {required int tvShowId, required int seasonNumber}) async {
    final response = await apiConsumer.get(
        '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.seasonPath}$seasonNumber');
    return List<SeasonEpisodeModel>.from(
      response['episodes'].map(
        (jsonData) => SeasonEpisodeModel.fromJson(jsonData),
      ),
    );
  }

  @override
  Future<TvShowAccountStatusModel> addOrRemoveMovieFromWatchList(
      {required int tvShowId,
      required bool isInWatchList,
      required String sessionId}) async {
    final response = await apiConsumer.post(
      ApiConstants.addOrRemoveFromWatchListEndPoint,
      queryParameters: {'session_id': sessionId},
      body: {
        'media_type': 'tv',
        "media_id": tvShowId,
        "watchlist": isInWatchList
      },
    );
    if (response['success'] == true) {
      return TvShowAccountStatusModel(isInWatchList: isInWatchList);
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
  Future<TvShowVideoModel> getEpisodeVideo(
      {required int tvShowId,
      required seasonNumber,
      required int episodeNumber}) async {
    final response = await apiConsumer.get(
        '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.seasonPath}$seasonNumber${ApiConstants.episodePath}$episodeNumber${ApiConstants.episodeVideoPath}');
    return TvShowVideoModel.fromJson(response['results']);
  }
}
