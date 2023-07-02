import 'package:tmda/features/search/domain/entities/search_content_states.dart';

class SearchContentStatesModel extends SearchContentStates {
  const SearchContentStatesModel({required super.inWatchList, super.contentId});

  factory SearchContentStatesModel.fromJson(Map<String, dynamic> jsonData) {
    return SearchContentStatesModel(
      inWatchList: jsonData['watchlist'] ?? false,
      contentId: jsonData['content_id'] ?? 0,
    );
  }
}
