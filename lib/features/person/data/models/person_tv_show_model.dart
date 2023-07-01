import 'package:tmda/features/person/data/models/person_contents_genres_model.dart';
import 'package:tmda/features/person/domain/entities/person_tv_show.dart';

class PersonTvShowModel extends PersonTvShow {
  const PersonTvShowModel({
    required super.title,
    required super.id,
    required super.posterPath,
    required super.language,
    required super.voteAverage,
    required super.voteCount,
    required super.genres,
    required super.firstAirDate,
  });

  factory PersonTvShowModel.fromJson(Map<String, dynamic> jsonData) {
    final List<Map<String, dynamic>> genresList = [
      {"id": 10759, "name": "Action"},
      {"id": 16, "name": "Animation"},
      {"id": 35, "name": "Comedy"},
      {"id": 80, "name": "Crime"},
      {"id": 99, "name": "Documentary"},
      {"id": 18, "name": "Drama"},
      {"id": 10751, "name": "Family"},
      {"id": 10762, "name": "Kids"},
      {"id": 9648, "name": "Mystery"},
      {"id": 10763, "name": "News"},
      {"id": 10764, "name": "Reality"},
      {"id": 10765, "name": "Sci-Fi"},
      {"id": 10766, "name": "Soap"},
      {"id": 10767, "name": "Talk"},
      {"id": 10768, "name": "War"},
      {"id": 37, "name": "Western"}
    ];
    List<Map<String, dynamic>> tvShowGenres = genresList.where((genre) => jsonData['genre_ids'].contains(genre['id'])).toList();

    return PersonTvShowModel(
      id: jsonData['id'],
      posterPath: jsonData['poster_path'] ?? '',
      title: jsonData['name'],
      language: jsonData['original_language'],
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genres: List<PersonContentsGenresModel>.from(
          tvShowGenres.map((jsonData) => PersonContentsGenresModel.fromJson(jsonData))),
      firstAirDate: jsonData['first_air_date'],
    );
  }
}
