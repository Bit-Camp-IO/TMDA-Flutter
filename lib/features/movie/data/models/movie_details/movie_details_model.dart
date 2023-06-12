import 'package:tmda/features/movie/data/models/movie/movie_genres_model.dart';
import 'package:tmda/features/movie/data/models/movie_details/movie_production_countries_model.dart';
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
    required super.movieProductionCountry,
    required super.movieVideo,
    required super.movieLanguage,
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
      movieProductionCountry: MovieProductionCountriesModel.fromJson(
        jsonData['production_countries'],
      ),
      movieVideo: MovieVideoModel.fromJson(
        jsonData['videos']['results'],
      ),
      movieLanguage: jsonData['original_language'],
    );
  }
}
