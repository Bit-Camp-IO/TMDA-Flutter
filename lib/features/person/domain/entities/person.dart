import 'package:equatable/equatable.dart';
import 'package:tmda/features/person/domain/entities/person_movie.dart';
import 'package:tmda/features/person/domain/entities/person_tv_show.dart';

class Person extends Equatable {
  final int id;
  final String biography;
  final String name;
  final String birthDay;
  final String knowingFor;
  final String placeOfBirth;
  final String profilePath;
  final List<PersonMovie> movies;
  final List<PersonTvShow> tvShows;

  const Person({
    required this.id,
    required this.biography,
    required this.name,
    required this.birthDay,
    required this.knowingFor,
    required this.placeOfBirth,
    required this.profilePath,
    required this.movies,
    required this.tvShows,
  });

  @override
  List<Object?> get props => [
    id,
    biography,
    name,
    birthDay,
    knowingFor,
    placeOfBirth,
    profilePath,
    movies,
    tvShows,
  ];
}
