import 'package:equatable/equatable.dart';

class MovieGenres extends Equatable {
  final int genreId;
  final String genreName;

  const MovieGenres({
    required this.genreId,
    required this.genreName,
  });

  @override
  List<Object?> get props => [genreName, genreId];
}
