import 'package:equatable/equatable.dart';
import 'package:tmda/features/person/domain/entities/person_contents_genres.dart';

class PersonTvShow extends Equatable {
  final String title;
  final int id;
  final String posterPath;
  final String firstAirDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<PersonContentsGenres> genres;

  const PersonTvShow({
    required this.title,
    required this.id,
    required this.posterPath,
    required this.firstAirDate,
    required this.language,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
  });

  PersonTvShow copyWith({
    String? title,
    int? id,
    String? posterPath,
    String? firstAirDate,
    String? language,
    dynamic voteAverage,
    int? voteCount,
    List<PersonContentsGenres>? genres,
  }) {
    return PersonTvShow(
      title: title ?? this.title,
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        posterPath,
        firstAirDate,
        posterPath,
        language,
        voteAverage,
        voteCount,
        genres,
      ];
}
