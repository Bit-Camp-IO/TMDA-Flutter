import 'package:equatable/equatable.dart';

class AccountStates extends Equatable {
  final int? contentId;
  final bool inWatchList;

  const AccountStates({
    required this.inWatchList,
    this.contentId,
  });

  @override
  List<Object?> get props => [inWatchList, contentId];
}
