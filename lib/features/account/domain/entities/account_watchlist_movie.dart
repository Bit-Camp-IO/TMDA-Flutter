import 'package:equatable/equatable.dart';
import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';
import 'package:tmda/features/movie/domain/entities/movies_genre.dart';

class AccountWatchListMovie extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String language;
  final dynamic voteAverage;
  final int movieVoteCount;
  final List<MovieGenres> genres;
  final MovieAccountStates accountStates;

  const AccountWatchListMovie({
    required this.id,
    required this.title,
    required this.posterPath,
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
    posterPath,
    language,
    releaseDate,
    voteAverage,
    movieVoteCount,
    genres,
    accountStates,
  ];

  AccountWatchListMovie copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? backDropPath,
    String? releaseDate,
    String? language,
    dynamic voteAverage,
    List<MovieGenres>? genres,
    int? movieVoteCount,
    MovieAccountStates? accountStates,
  }) {
    return AccountWatchListMovie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      genres: genres ?? this.genres,
      movieVoteCount: movieVoteCount ?? this.movieVoteCount,
      accountStates: accountStates ?? this.accountStates,
    );
  }
}
