import 'package:equatable/equatable.dart';
import 'package:tmda/features/search/domain/entities/search_content_states.dart';
import 'package:tmda/features/search/domain/entities/search_genre.dart';

class TvShowSearch extends Equatable {
  final String title;
  final int id;
  final String posterPath;
  final String firstAirDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<SearchGenre> genres;
  final SearchContentStates contentStates;

  const TvShowSearch({
    required this.title,
    required this.id,
    required this.posterPath,
    required this.language,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.firstAirDate,
    required this.contentStates,
  });

  TvShowSearch copyWith({
    String? title,
    int? id,
    String? backDropPath,
    String? posterPath,
    String? firstAirDate,
    String? language,
    String? overview,
    dynamic voteAverage,
    int? voteCount,
    List<SearchGenre>? genres,
    SearchContentStates? contentStates,
  }) {
    return TvShowSearch(
      title: title ?? this.title,
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
      contentStates: contentStates ?? this.contentStates,
    );
  }

  @override
  List<Object?> get props => [
    id,
    posterPath,
    title,
    language,
    voteAverage,
    voteCount,
    genres,
    firstAirDate,
    contentStates
  ];
}
