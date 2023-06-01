import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie_genres.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final String posterPath;
  final dynamic id;
  final List<MovieGenres> genres;
  final String overview;
  final String releaseDate;
  final String title;
  final dynamic runTime;
  final dynamic voteAverage;

  const MovieDetails({
    required this.posterPath,
    required this.genres,
    required this.backDropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.runTime,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        overview,
        releaseDate,
        title,
        runTime,
        voteAverage,
        genres
      ];
}
