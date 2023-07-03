import 'package:equatable/equatable.dart';
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

  const TvShowSearch({
    required this.title,
    required this.id,
    required this.posterPath,
    required this.language,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.firstAirDate,
  });

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
  ];
}
