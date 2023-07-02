import 'package:equatable/equatable.dart';
import 'package:tmda/features/search/domain/entities/search_content_states.dart';
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
  final SearchContentStates contentStates;

  const MovieSearch({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.language,
    required this.contentStates,
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
    contentStates,
  ];

  MovieSearch copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? backDropPath,
    String? releaseDate,
    String? language,
    dynamic voteAverage,
    List<SearchGenre>? genres,
    int? voteCount,
    SearchContentStates? contentStates,
  }) {
    return MovieSearch(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      genres: genres ?? this.genres,
      voteCount: voteCount ?? this.voteCount,
      contentStates: contentStates ?? this.contentStates,
    );
  }
}
