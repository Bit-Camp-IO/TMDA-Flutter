import 'package:injectable/injectable.dart';
import 'package:tmda/core/api/api_consumer.dart';
import 'package:tmda/core/constants/api_constants.dart';
import 'package:tmda/core/error/exception.dart';
import 'package:tmda/features/shared/data/models/tv_show_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_details_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class TvDataSource {
  Future<List<TvShowModel>> getTvShowsAiringToday(int pageNumber);

  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber);

  Future<List<TvShowModel>> getPopularTvShows(int pageNumber);

  Future<List<TvShowModel>> getTopRatedTopRatedTvShows(int pageNumber);

  Future<TvShowDetailsModel> getTvShowDetails({
    required int tvShowId,
  });

  Future<void> playTvShowVideo(String youtubeVideoKey);

  Future<List<TvShowModel>> getSimilarTvShows({
    required int tvShowId,
    required int pageNumber,
  });

  Future<List<TvShowModel>> getRecommendedTvShows({
    required int tvShowId,
    required int pageNumber,
  });
}

@LazySingleton(as: TvDataSource)
class TvDataSourceImpl extends TvDataSource {
  final ApiConsumer _apiConsumer;

  TvDataSourceImpl(this._apiConsumer);

  @override
  Future<List<TvShowModel>> getTvShowsAiringThisWeek(int pageNumber) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
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
    final Map<String, dynamic> response = await _apiConsumer.get(
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
    final Map<String, dynamic> response = await _apiConsumer.get(
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
    final Map<String, dynamic> response = await _apiConsumer.get(
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
  Future<TvShowDetailsModel> getTvShowDetails({required int tvShowId}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId',
      queryParameters: {
        'append_to_response': ApiConstants.detailsEndPointsAppendedToResponse,
        'page': 1,
      },
    );
    return TvShowDetailsModel.fromJson(response);
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
  Future<List<TvShowModel>> getRecommendedTvShows(
      {required int tvShowId, required int pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.recommendationsPath}',
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      (response['results'] as List).map(
        (tvShow) => TvShowModel.fromJson(tvShow),
      ),
    );
  }

  @override
  Future<List<TvShowModel>> getSimilarTvShows(
      {required int tvShowId, required int pageNumber}) async {
    final Map<String, dynamic> response = await _apiConsumer.get(
      '${ApiConstants.tvShowDetailsEndPoint}$tvShowId${ApiConstants.similarPath}',
      queryParameters: {'page': pageNumber},
    );
    return List<TvShowModel>.from(
      (response['results'] as List).map(
        (tvShow) => TvShowModel.fromJson(tvShow),
      ),
    );
  }
}
