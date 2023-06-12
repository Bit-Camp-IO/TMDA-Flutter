import 'package:equatable/equatable.dart';

class MovieGenres extends Equatable {
  final int id;
  final String name;

  const MovieGenres({
    required this.id,
    required this.name,
  });
  
  @override
  List<Object?> get props => [name, id];
}
