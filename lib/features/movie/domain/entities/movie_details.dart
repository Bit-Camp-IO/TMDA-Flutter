import 'package:equatable/equatable.dart';
import 'package:tmda/features/shared/domain/entities/movie.dart';
import 'package:tmda/features/movie/domain/entities/movie_cast.dart';
import 'package:tmda/features/movie/domain/entities/movie_production_countries.dart';
import 'package:tmda/features/movie/domain/entities/movie_reviews.dart';
import 'package:tmda/features/movie/domain/entities/movie_video.dart';
import 'package:tmda/features/shared/domain/entities/movie_genre.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backDropPath;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final String language;
  final String title;
  final num runTime;
  final double voteAverage;
  final num popularity;
  final MovieProductionCountries productionCountry;
  final List<MovieGenres> genres;
  final MovieVideo video;
  final List<MovieReviews> reviews;
  final List<MovieCast> cast;
  final List<Movie> similarMovies;
  final List<Movie> recommendedMovies;

  const MovieDetails({
    this.posterPath = '',
    this.backDropPath = '',
    this.id = 0,
    this.overview = '',
    this.releaseDate = '',
    this.title = '',
    this.runTime = 0,
    this.voteAverage = 0,
    this.popularity = 0,
    this.language = '',
    this.productionCountry = const MovieProductionCountries(
      countryCode: '',
      countryName: '',
    ),
    this.video = const MovieVideo(
      name: '',
      key: '',
      videoType: '',
    ),
    this.cast = const [],
    this.reviews = const [],
    this.similarMovies = const [],
    this.recommendedMovies = const [],
    this.genres = const [],
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
        video,
        productionCountry,
        language,
        reviews,
        cast,
        similarMovies,
        recommendedMovies,
      ];

  MovieDetails copyWith({
    String? backDropPath,
    String? posterPath,
    int? id,
    String? overview,
    String? releaseDate,
    String? language,
    String? title,
    dynamic runTime,
    double? voteAverage,
    dynamic popularity,
    MovieProductionCountries? productionCountry,
    List<MovieGenres>? genres,
    MovieVideo? video,
    List<MovieReviews>? reviews,
    List<MovieCast>? cast,
    List<Movie>? similarMovies,
    List<Movie>? recommendedMovies,
  }) {
    return MovieDetails(
        backDropPath: backDropPath ?? this.backDropPath,
        posterPath: posterPath ?? this.posterPath,
        id: id ?? this.id,
        overview: overview ?? this.overview,
        releaseDate: releaseDate ?? this.releaseDate,
        language: language ?? this.language,
        title: title ?? this.title,
        runTime: runTime ?? this.runTime,
        voteAverage: voteAverage ?? this.voteAverage,
        popularity: popularity ?? this.popularity,
        productionCountry: productionCountry ?? this.productionCountry,
        genres: genres ?? this.genres,
        video: video ?? this.video,
        reviews: reviews ?? this.reviews,
        cast: cast ?? this.cast,
        similarMovies: similarMovies ?? this.similarMovies,
        recommendedMovies: recommendedMovies ?? this.recommendedMovies);
  }
}
