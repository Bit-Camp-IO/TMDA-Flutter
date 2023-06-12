import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies_genre.dart';

class Movies extends Equatable {
  final int movieId;
  final String movieTitle;
  final String movieOverview;
  final String moviePosterPath;
  final String movieBackDropPath;
  final String movieReleaseDate;
  final String movieLanguage;
  final dynamic movieVote;
  final List<MovieGenres> movieGenres;
  final int movieVoteCount;
  const Movies({
    required this.movieId,
    required this.movieTitle,
    required this.movieOverview,
    required this.moviePosterPath,
    required this.movieBackDropPath,
    required this.movieReleaseDate,
    required this.movieVote,
    required this.movieVoteCount,
    required this.movieGenres,
    required this.movieLanguage,
  });

  @override
  List<Object?> get props => [
        movieId,
        movieTitle,
        movieOverview,
        moviePosterPath,
        movieBackDropPath,
        movieLanguage,
        movieReleaseDate,
        movieVote,
        movieVoteCount,
        movieGenres,
      ];
}
