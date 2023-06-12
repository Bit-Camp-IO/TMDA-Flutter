import 'package:tmda/features/movie/domain/entities/movie_details/movie_cast.dart';

class MovieCastModel extends MovieCast {
  const MovieCastModel({
    required super.actorName,
    required super.movieCharacter,
    required super.actorPicPath,
    required super.actorId,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieCastModel(
      actorName: jsonData['name'],
      actorPicPath: jsonData['profile_path'],
      movieCharacter: jsonData['character'],
      actorId: jsonData['id'],
    );
  }
}
