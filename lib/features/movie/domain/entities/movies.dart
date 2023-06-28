import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movies_genre.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backDropPath;
  final String releaseDate;
  final String language;
  final dynamic voteAverage;
  final int movieVoteCount;
  final List<MovieGenres> genres;
  final MovieAccountStates accountStates;

  const Movies({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backDropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.movieVoteCount,
    required this.genres,
    required this.language,
    required this.accountStates,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backDropPath,
        language,
        releaseDate,
        voteAverage,
        movieVoteCount,
        genres,
        accountStates,
      ];

  Movies copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    String? backDropPath,
    String? releaseDate,
    String? language,
    dynamic voteAverage,
    List<MovieGenres>? genres,
    int? movieVoteCount,
    MovieAccountStates? accountStates,
  }) {
    return Movies(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      backDropPath: backDropPath ?? this.backDropPath,
      releaseDate: releaseDate ?? this.releaseDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      genres: genres ?? this.genres,
      movieVoteCount: movieVoteCount ?? this.movieVoteCount,
      accountStates: accountStates ?? this.accountStates,
    );
  }
}
