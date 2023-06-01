import 'package:tmda/features/movie/data/models/movie_genres_model.dart';
import 'package:tmda/features/movie/domain/entities/movie_details.dart';

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
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieDetailsModel(
      posterPath: jsonData['poster_path'],
      genres: List<MovieGenresModel>.from(
          jsonData['genres'].map((x) => MovieGenresModel.fromJson(x))),
      backDropPath: jsonData['backdrop_path'],
      id: jsonData['id'],
      overview: jsonData['overview'],
      releaseDate: jsonData['release_date'],
      title: jsonData['title'],
      runTime: jsonData['runtime'],
      voteAverage: jsonData['vote_average'],
    );
  }
}
