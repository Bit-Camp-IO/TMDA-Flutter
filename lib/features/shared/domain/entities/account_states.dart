import 'package:equatable/equatable.dart';

class AccountStates extends Equatable {
  final int? contentId;
  final bool isInWatchList;

  const AccountStates({
    required this.isInWatchList,
    this.contentId,
  });

  @override
  List<Object?> get props => [isInWatchList, contentId];
}
