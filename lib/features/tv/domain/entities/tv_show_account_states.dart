import 'package:equatable/equatable.dart';

class TvShowAccountStates extends Equatable {
  final int? tvShowId;
  final bool? isFavoriteMovie;
  final bool isInWatchList;
  const TvShowAccountStates({
    this.tvShowId,
    this.isFavoriteMovie,
    required this.isInWatchList,
  });

  @override
  List<Object?> get props => [tvShowId, isFavoriteMovie, isInWatchList];
}
