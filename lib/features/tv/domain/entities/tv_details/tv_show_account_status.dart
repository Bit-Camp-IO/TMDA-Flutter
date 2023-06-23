import 'package:equatable/equatable.dart';

class TvShowAccountStatus extends Equatable {
  final bool? isFavoriteMovie;
  final bool isInWatchList;
  const TvShowAccountStatus({
    this.isFavoriteMovie,
    required this.isInWatchList,
  });

  @override
  List<Object?> get props => [isFavoriteMovie, isInWatchList];
}
