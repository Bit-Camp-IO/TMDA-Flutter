// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int? movieId;
  final String? movieTitle;
  final String? movieOverview;
  final String? moviePosterPath;
  final String? movieBackDropPath;
  final String? movieReleaseDate;
  final dynamic movieVote;
  final int? movieVoteCount;
  const Movies({
    this.movieId,
    this.movieTitle,
    this.movieOverview,
    this.moviePosterPath,
    this.movieBackDropPath,
    this.movieReleaseDate,
    this.movieVote,
    this.movieVoteCount,
  });
  
  
  @override
  List<Object?> get props => [movieId, movieTitle, movieOverview, moviePosterPath, movieBackDropPath, movieReleaseDate, movieVote, movieVoteCount];

}
