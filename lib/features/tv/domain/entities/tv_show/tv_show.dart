import 'package:equatable/equatable.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show_genres.dart';

class TvShow extends Equatable {
  final String backDropPath;
  final String posterPath;
  final String name;
  final String language;
  final String overview;
  final dynamic voteAverage;
  final int voteCount;
  final List<TvShowGenres> genres;
  final String firstAirDate;
  const TvShow({
    required this.backDropPath,
    required this.posterPath,
    required this.name,
    required this.language,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.firstAirDate,
  });

  @override
  List<Object?> get props => [
        backDropPath,
        posterPath,
        name,
        language,
        overview,
        voteAverage,
        voteCount,
        genres,
        firstAirDate,
      ];
}
