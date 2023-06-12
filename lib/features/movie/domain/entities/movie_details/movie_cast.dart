import 'package:equatable/equatable.dart';

class MovieCast extends Equatable {
  final String actorName;
  final String actorPicPath;
  final String movieCharacter;
  final int actorId;
  const MovieCast( {
    required this.actorId,
    required this.actorName,
    required this.movieCharacter,
    required this.actorPicPath,
  });

  @override
  List<Object?> get props => [actorName, actorPicPath, movieCharacter, actorId];
}
