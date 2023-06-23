import 'package:tmda/features/movie/data/models/movie/movie_genres_model.dart';
import 'package:tmda/features/movie/data/models/movie/movies_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_account_states_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_cast_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_production_countries_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_review_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_video_model.dart';
import 'package:tmda/features/movie/domain/entities/movie_details/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.posterPath,
    required super.genres,
    required super.backDropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.runTime,
    required super.voteAverage,
    required super.popularity,
    required super.productionCountry,
    required super.video,
    required super.language,
    required super.status,
    required super.cast,
    required super.reviews,
    required super.similarMovies,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieDetailsModel(
      posterPath: jsonData['poster_path'] ?? '',
      genres: List<MovieGenresModel>.from(
        jsonData['genres'].map(
          (jsonData) => MovieGenresModel.fromJson(jsonData),
        ),
      ),
      backDropPath: jsonData['backdrop_path'] ?? '',
      id: jsonData['id'],
      overview: jsonData['overview'],
      releaseDate: jsonData['release_date'],
      title: jsonData['title'],
      runTime: jsonData['runtime'],
      voteAverage: jsonData['vote_average'],
      popularity: jsonData['popularity'],
      productionCountry: MovieProductionCountriesModel.fromJson(
        jsonData['production_countries'],
      ),
      video: MovieVideoModel.fromJson(
        jsonData['videos']['results'],
      ),
      language: jsonData['original_language'],
      status:
          MovieAccountStatesModel.fromJson(jsonData['account_states']),
      cast: List<MovieCastModel>.from(
        jsonData['credits']['cast'].map(
          (jsonData) => MovieCastModel.fromJson(jsonData),
        ),
      ),
      reviews: List<MovieReviewsModel>.from(
        jsonData['reviews']['results'].map(
          (jsonData) => MovieReviewsModel.fromJson(jsonData),
        ),
      ),
      similarMovies: List<MoviesModel>.from(
        jsonData['similar']['results'].map(
          (jsonData) => MoviesModel.fromJson(jsonData),
        ),
      ),
    );
  }
}
