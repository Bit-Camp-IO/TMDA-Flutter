import 'package:equatable/equatable.dart';

class PersonSearch extends Equatable {
  final int id;
  final String name;
  final String knowingFor;
  final String profilePath;

  const PersonSearch({
    required this.id,
    required this.name,
    required this.knowingFor,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    knowingFor,
    profilePath,
  ];
}
