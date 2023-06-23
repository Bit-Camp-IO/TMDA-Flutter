import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies_genre.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_cast.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_production_countries.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_reviews.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_video.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final String posterPath;
  final int id;
  final String overview;
  final String releaseDate;
  final String language;
  final String title;
  final dynamic runTime;
  final double voteAverage;
  final dynamic popularity;
  final MovieProductionCountries productionCountry;
  final MovieAccountStatus status;
  final List<MovieGenres> genres;
  final MovieVideo video;
  final List<MovieReviews> reviews;
  final List<MovieCast> cast;
  final List<Movies> similarMovies;
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
    required this.productionCountry,
    required this.video,
    required this.language,
    required this.status,
    required this.reviews,
    required this.cast,
    required this.similarMovies,
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
        status,
        reviews,
        cast,
        similarMovies,
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
    MovieAccountStatus? status,
    List<MovieGenres>? genres,
    MovieVideo? video,
    List<MovieReviews>? reviews,
    List<MovieCast>? cast,
    List<Movies>? similarMovies,
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
      status: status ?? this.status,
      genres: genres ?? this.genres,
      video: video ?? this.video,
      reviews: reviews ?? this.reviews,
      cast: cast ?? this.cast,
      similarMovies: similarMovies ?? this.similarMovies,
    );
  }
}
