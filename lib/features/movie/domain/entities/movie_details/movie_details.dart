import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies_genre.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_production_countries.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_video.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final String posterPath;
  final dynamic id;
  final String overview;
  final String releaseDate;
  final String movieLanguage;
  final String title;
  final dynamic runTime;
  final double voteAverage;
  final dynamic popularity;
  final MovieProductionCountries movieProductionCountry;
  final List<MovieGenres> genres;
  final MovieVideo movieVideo;


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
    required this.popularity,
    required this.movieProductionCountry,
    required this.movieVideo,
    required this.movieLanguage,
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
        genres,
        movieVideo,
        movieProductionCountry,
        movieLanguage,
      ];
}
