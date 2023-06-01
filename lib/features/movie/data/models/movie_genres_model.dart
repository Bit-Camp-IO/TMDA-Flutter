import 'package:tmda/features/movie/domain/entities/movie_genres.dart';

class MovieGenresModel extends MovieGenres {
  const MovieGenresModel({required super.genreName, required super.genreId});

  factory MovieGenresModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieGenresModel(
      genreId: jsonData['id'],
      genreName: jsonData['name'],
    );
  }
}
