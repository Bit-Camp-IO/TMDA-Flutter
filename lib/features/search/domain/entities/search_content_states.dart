import 'package:equatable/equatable.dart';

class SearchContentStates extends Equatable {
  final bool inWatchList;
  final int? contentId;
  const SearchContentStates({
    required this.inWatchList,
    this.contentId,
  });

  @override
  List<Object?> get props => [inWatchList, contentId];
}
