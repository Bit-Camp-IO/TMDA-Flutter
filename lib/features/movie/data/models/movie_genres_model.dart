import 'package:tmda/features/movie/domain/entities/movies_genre.dart';

class MovieGenresModel extends MovieGenres {
  const MovieGenresModel({required super.name, required super.id});

  factory MovieGenresModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieGenresModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
