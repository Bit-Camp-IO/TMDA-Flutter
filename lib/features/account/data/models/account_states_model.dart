import 'package:tmda/features/account/domain/entities/account_states.dart';

class AccountStatesModel extends AccountStates {
  const AccountStatesModel({required super.inWatchList, super.contentId});

  factory AccountStatesModel.fromJson(Map<String, dynamic> jsonData) {
    return AccountStatesModel(
      inWatchList: jsonData['watchlist'] ?? false,
      contentId: jsonData['content_id'] ?? 0,
    );
  }
}
