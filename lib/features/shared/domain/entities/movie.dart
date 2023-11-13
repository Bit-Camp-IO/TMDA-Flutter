import 'package:equatable/equatable.dart';
import 'package:tmda/features/shared/domain/entities/movie_genre.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backDropPath;
  final String releaseDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<MovieGenres> genres;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backDropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.language,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backDropPath,
        language,
        releaseDate,
        voteAverage,
        voteCount,
        genres,
      ];

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    String? backDropPath,
    String? releaseDate,
    String? language,
    dynamic voteAverage,
    List<MovieGenres>? genres,
    int? voteCount,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backDropPath: backDropPath ?? this.backDropPath,
      releaseDate: releaseDate ?? this.releaseDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      genres: genres ?? this.genres,
      voteCount: voteCount ?? this.voteCount,
    );
  }
}
