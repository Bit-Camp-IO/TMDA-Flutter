import 'package:equatable/equatable.dart';

class TvShowSeasons extends Equatable {
  final int seasonId;
  final int seasonNumber;
  final int episodesCount;
  final String seasonName;
  final String seasonOverview;
  final String seasonAirDate;
  final String seasonPosterPath;
  const TvShowSeasons( {
    required this.seasonId,
    required this.seasonNumber,
    required this.episodesCount,
    required this.seasonName,
    required this.seasonOverview,
    required this.seasonAirDate,
    required this.seasonPosterPath,
  });

  @override
  List<Object?> get props => [
        seasonId,
        seasonNumber,
        episodesCount,
        seasonName,
        seasonOverview,
        seasonAirDate,
        seasonPosterPath
      ];
}
