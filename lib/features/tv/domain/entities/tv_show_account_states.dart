import 'package:equatable/equatable.dart';

class TvShowAccountStates extends Equatable {
  final int? id;
  final bool isInWatchList;
  const TvShowAccountStates({
    this.id,
    required this.isInWatchList,
  });

  @override
  List<Object?> get props => [id, isInWatchList];
}
