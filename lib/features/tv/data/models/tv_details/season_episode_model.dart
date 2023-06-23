import 'package:tmda/features/tv/domain/entities/tv_details/season_episode.dart';

class SeasonEpisodeModel extends SeasonEpisode {
  const SeasonEpisodeModel({
    required super.name,
    required super.posterPath,
    required super.number,
    required super.id,
    required super.voteCount,
    required super.voteAverage,
    required super.airDate,
    required super.runTime,
  });

  factory SeasonEpisodeModel.fromJson(Map<String, dynamic> jsonData) {
    return SeasonEpisodeModel(
      name: jsonData['name'],
      posterPath: jsonData['still_path'] ?? '',
      number: jsonData['episode_number'],
      id: jsonData['id'],
      voteCount: jsonData['vote_count'],
      voteAverage: jsonData['vote_average'],
      airDate: jsonData['air_date'] ?? 'NaN',
      runTime: jsonData['runtime'] ?? 0,
    );
  }
}
