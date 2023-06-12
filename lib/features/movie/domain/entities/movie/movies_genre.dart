import 'package:equatable/equatable.dart';

class MovieGenres extends Equatable {
  final int id;
  final String name;
  const MovieGenres({
    required this.name,
    required this.id,
  });
  
  @override
  List<Object?> get props => [id, name];
}
