import 'package:tmda/features/movie/data/models/movie/movie_genres_model.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
    required super.backDropPath,
    required super.releaseDate,
    required super.voteAverage,
    required super.movieVoteCount,
    required super.genres,
    required super.language,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> jsonData) {
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
    List<dynamic> movieGenres = [];

    for (int genreId in jsonData['genre_ids']) {
      movieGenres
          .add(genresList.firstWhere((element) => element['id'] == genreId));
    }

    return MoviesModel(
      id: jsonData['id'],
      title: jsonData['title'],
      overview: jsonData['overview'],
      posterPath: jsonData['poster_path'] ?? '',
      backDropPath: jsonData['backdrop_path'] ?? '',
      releaseDate: jsonData['release_date'],
      voteAverage: jsonData['vote_average'],
      movieVoteCount: jsonData['vote_count'],
      genres: List<MovieGenresModel>.from(
        movieGenres.map((jsonData) => MovieGenresModel.fromJson(jsonData)),
      ),
    language: jsonData['original_language']
    );
  }
}
