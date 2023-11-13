import 'package:tmda/features/shared/domain/entities/account_states.dart';

class AccountStatesModel extends AccountStates {
  const AccountStatesModel({required super.isInWatchList, super.contentId});

  factory AccountStatesModel.fromJson(Map<String, dynamic> jsonData) {
    return AccountStatesModel(
      isInWatchList: jsonData['watchlist'] ?? false,
      contentId: jsonData['content_id'] ?? 0,
    );
  }
}
