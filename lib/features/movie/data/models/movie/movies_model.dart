import 'package:tmda/features/movie/data/models/movie/movie_genres_model.dart';
import 'package:tmda/features/movie/domain/entities/movie/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.movieId,
    required super.movieTitle,
    required super.movieOverview,
    required super.moviePosterPath,
    required super.movieBackDropPath,
    required super.movieReleaseDate,
    required super.movieVote,
    required super.movieVoteCount,
    required super.movieGenres,
    required super.movieLanguage,
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
      movieId: jsonData['id'],
      movieTitle: jsonData['title'],
      movieOverview: jsonData['overview'],
      moviePosterPath: jsonData['poster_path'] ?? '',
      movieBackDropPath: jsonData['backdrop_path'] ?? '',
      movieReleaseDate: jsonData['release_date'],
      movieVote: jsonData['vote_average'],
      movieVoteCount: jsonData['vote_count'],
      movieGenres: List<MovieGenresModel>.from(
        movieGenres.map((jsonData) => MovieGenresModel.fromJson(jsonData)),
      ),
    movieLanguage: jsonData['original_language']
    );
  }
}
