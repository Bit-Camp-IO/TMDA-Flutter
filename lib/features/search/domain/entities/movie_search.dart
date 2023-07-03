import 'package:equatable/equatable.dart';
import 'package:tmda/features/search/domain/entities/search_genre.dart';

class MovieSearch extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<SearchGenre> genres;

  const MovieSearch({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.language,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    language,
    releaseDate,
    voteAverage,
    voteCount,
    genres,
  ];
}
