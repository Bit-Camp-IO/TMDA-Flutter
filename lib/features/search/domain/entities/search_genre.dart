import 'package:equatable/equatable.dart';

class SearchGenre extends Equatable {
  final int id;
  final String name;
  const SearchGenre({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [id, name];
}
