import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_seasons.dart';

class TvShowSeasonsModel extends TvShowSeasons {
  const TvShowSeasonsModel({
    required super.seasonId,
    required super.seasonNumber,
    required super.episodesCount,
    required super.seasonName,
    required super.seasonOverview,
    required super.seasonAirDate,
    required super.seasonPosterPath
  });

  factory TvShowSeasonsModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowSeasonsModel(
      seasonId: jsonData['id'],
      seasonNumber: jsonData['season_number'],
      episodesCount: jsonData['episode_count'],
      seasonName: jsonData['name'],
      seasonOverview: jsonData['overview'],
      seasonAirDate: jsonData['air_date'] ?? 'NaN',
      seasonPosterPath: jsonData['poster_path'] ?? '',
    );
  }
}
