import 'package:tmda/features/movie/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    super.movieId,
    super.movieTitle,
    super.movieOverview,
    super.moviePosterPath,
    super.movieBackDropPath,
    super.movieReleaseDate,
    super.movieVote,
    super.movieVoteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> jsonData){
    return MoviesModel(
      movieId: jsonData['id'],
      movieTitle: jsonData['title'],
      movieOverview: jsonData['overview'],
      moviePosterPath: jsonData['poster_path'],
      movieBackDropPath: jsonData['backdrop_path'],
      movieReleaseDate: jsonData['release_date'],
      movieVote: jsonData['vote_average'],
      movieVoteCount: jsonData['vote_count']
    );
  }
}
