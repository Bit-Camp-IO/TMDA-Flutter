import 'package:tmda/features/person/data/models/person_movie_model.dart';
import 'package:tmda/features/person/data/models/person_tv_show_model.dart';
import 'package:tmda/features/person/domain/entities/person.dart';

class PersonModel extends Person {
  const PersonModel({
    required super.id,
    required super.biography,
    required super.name,
    required super.birthDay,
    required super.knowingFor,
    required super.placeOfBirth,
    required super.profilePath,
    required super.movies,
    required super.tvShows,
  });

  factory PersonModel.fromJson(Map<String, dynamic> jsonData) {
    final moviesList = {...(jsonData['movie_credits']['cast'] as List), ...(jsonData['movie_credits']['crew'] as List)}.toList();
    final tvShowsList = {...(jsonData['tv_credits']['cast'] as List), ...(jsonData['tv_credits']['crew'] as List)}.toList();
    return PersonModel(
      id: jsonData['id'],
      biography: jsonData['biography'],
      name: jsonData['name'],
      birthDay: jsonData['birthday'],
      knowingFor: jsonData['known_for_department'],
      placeOfBirth: jsonData['place_of_birth'],
      profilePath: jsonData['profile_path'] ?? '',
      movies: List<PersonMovieModel>.from(moviesList.map((movie) => PersonMovieModel.fromJson(movie))),
      tvShows: List<PersonTvShowModel>.from(tvShowsList.map((tvShow) => PersonTvShowModel.fromJson(tvShow))),
    );
  }
}
