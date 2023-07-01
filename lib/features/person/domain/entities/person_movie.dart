import 'package:equatable/equatable.dart';
import 'package:tmda/features/person/domain/entities/person_contents_genres.dart';

class PersonMovie extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<PersonContentsGenres> genres;

  const PersonMovie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.language,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
  });

  PersonMovie copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? releaseDate,
    String? language,
    dynamic voteAverage,
    int? voteCount,
    List<PersonContentsGenres>? genres,
  }) {
    return PersonMovie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    releaseDate,
    language,
    voteAverage,
    voteCount,
    genres,
  ];
}
