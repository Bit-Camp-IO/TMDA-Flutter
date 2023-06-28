import 'package:tmda/features/tv/domain/entities/tv_show_seasons.dart';

class TvShowSeasonsModel extends TvShowSeasons {
  const TvShowSeasonsModel({
    required super.id,
    required super.number,
    required super.episodesCount,
    required super.name,
    required super.overview,
    required super.airDate,
    required super.posterPath
  });

  factory TvShowSeasonsModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowSeasonsModel(
      id: jsonData['id'],
      number: jsonData['season_number'],
      episodesCount: jsonData['episode_count'],
      name: jsonData['name'],
      overview: jsonData['overview'],
      airDate: jsonData['air_date'] ?? 'NaN',
      posterPath: jsonData['poster_path'] ?? '',
    );
  }
}
