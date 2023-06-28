import 'package:equatable/equatable.dart';

class MovieAccountStates extends Equatable {
  final int? movieId;
  final bool inWatchList;

  const MovieAccountStates({
    required this.inWatchList,
    this.movieId,
  });

  @override
  List<Object?> get props => [inWatchList, movieId];
}
