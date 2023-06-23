import 'package:equatable/equatable.dart';
import 'package:tmda/features/tv/domain/entities/tv_show/tv_show_genres.dart';

class TvShow extends Equatable {
  final String title;
  final int tvShowId;
  final String backDropPath;
  final String posterPath;
  final String firstAirDate;
  final String language;
  final String overview;
  final dynamic voteAverage;
  final int voteCount;
  final List<TvShowGenres> genres;

  const TvShow({
    required this.title,
    required this.tvShowId,
    required this.backDropPath,
    required this.posterPath,
    required this.language,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.firstAirDate,
  });

  @override
  List<Object?> get props => [
        tvShowId,
        backDropPath,
        posterPath,
        title,
        language,
        overview,
        voteAverage,
        voteCount,
        genres,
        firstAirDate,
      ];
}
