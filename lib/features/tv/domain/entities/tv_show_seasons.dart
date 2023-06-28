import 'package:equatable/equatable.dart';

class TvShowSeasons extends Equatable {
  final int id;
  final int number;
  final int episodesCount;
  final String name;
  final String overview;
  final String airDate;
  final String posterPath;
  const TvShowSeasons( {
    required this.id,
    required this.number,
    required this.episodesCount,
    required this.name,
    required this.overview,
    required this.airDate,
    required this.posterPath,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        episodesCount,
        name,
        overview,
        airDate,
        posterPath
      ];
}
