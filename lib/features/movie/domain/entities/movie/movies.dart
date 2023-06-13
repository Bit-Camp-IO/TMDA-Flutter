import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies_genre.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backDropPath;
  final String releaseDate;
  final String language;
  final dynamic voteAverage;
  final List<MovieGenres> genres;
  final int movieVoteCount;
  const Movies({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backDropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.movieVoteCount,
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
        movieVoteCount,
        genres,
      ];
}
