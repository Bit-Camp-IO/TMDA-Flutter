import 'package:equatable/equatable.dart';
import 'package:tmda/features/shared/domain/entities/tv_show_genres.dart';

class TvShow extends Equatable {
  final String title;
  final int id;
  final String backDropPath;
  final String posterPath;
  final String firstAirDate;
  final String language;
  final String overview;
  final num voteAverage;
  final int voteCount;
  final List<TvShowGenres> genres;

  const TvShow({
    required this.title,
    required this.id,
    required this.backDropPath,
    required this.posterPath,
    required this.language,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.firstAirDate,
  });

  TvShow copyWith({
    String? title,
    int? id,
    String? backDropPath,
    String? posterPath,
    String? firstAirDate,
    String? language,
    String? overview,
    dynamic voteAverage,
    int? voteCount,
    List<TvShowGenres>? genres,
  }) {
    return TvShow(
      title: title ?? this.title,
      id: id ?? this.id,
      backDropPath: backDropPath ?? this.backDropPath,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      language: language ?? this.language,
      overview: overview ?? this.overview,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [
        id,
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
