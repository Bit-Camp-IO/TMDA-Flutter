import 'package:tmda/features/person/data/models/person_contents_genres_model.dart';
import 'package:tmda/features/person/domain/entities/person_movie.dart';

class PersonMovieModel extends PersonMovie{
  const PersonMovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.voteCount,
    required super.genres,
    required super.language,
  });

  factory PersonMovieModel.fromJson(Map<String, dynamic> jsonData) {
    final List<Map<String, dynamic>> genresList = [
      {'id': 28, 'name': 'Action'},
      {'id': 12, 'name': 'Adventure'},
      {'id': 16, 'name': 'Animation'},
      {'id': 35, 'name': 'Comedy'},
      {'id': 80, 'name': 'Crime'},
      {'id': 99, 'name': 'Documentary'},
      {'id': 18, 'name': 'Drama'},
      {'id': 10751, 'name': 'Family'},
      {'id': 14, 'name': 'Fantasy'},
      {'id': 36, 'name': 'History'},
      {'id': 27, 'name': 'Horror'},
      {'id': 10402, 'name': 'Music'},
      {'id': 9648, 'name': 'Mystery'},
      {'id': 10749, 'name': 'Romance'},
      {'id': 878, 'name': 'Fiction'},
      {'id': 10770, 'name': 'TV Movie'},
      {'id': 53, 'name': 'Thriller'},
      {'id': 10752, 'name': 'War'},
      {'id': 37, 'name': 'Western'},
    ];
    List<Map<String, dynamic>> movieGenres = genresList.where((genre) => jsonData['genre_ids'].contains(genre['id'])).toList();
    return PersonMovieModel(
      id: jsonData['id'],
      title: jsonData['title'],
      posterPath: jsonData['poster_path'] ?? '',
      releaseDate: jsonData['release_date'],
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genres: List<PersonContentsGenresModel>.from(
        movieGenres.map((jsonData) => PersonContentsGenresModel.fromJson(jsonData)),
      ),
      language: jsonData['original_language'],
    );
  }
}
