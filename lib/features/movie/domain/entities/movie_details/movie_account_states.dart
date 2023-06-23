import 'package:equatable/equatable.dart';

class MovieAccountStatus extends Equatable {
  final bool? isFavoriteMovie;
  final bool inWatchList;
  const MovieAccountStatus({
    required this.isFavoriteMovie,
    required this.inWatchList,
  });

  @override
  List<Object?> get props => [isFavoriteMovie, inWatchList];
}
