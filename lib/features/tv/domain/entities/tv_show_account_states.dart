import 'package:equatable/equatable.dart';

class TvShowAccountStates extends Equatable {
  final int? tvShowId;
  final bool isInWatchList;
  const TvShowAccountStates({
    this.tvShowId,
    required this.isInWatchList,
  });

  @override
  List<Object?> get props => [tvShowId, isInWatchList];
}
