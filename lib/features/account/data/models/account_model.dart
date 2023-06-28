import 'package:tmda/features/account/domain/entities/account.dart';

class AccountModel extends Account {
  const AccountModel({
    required super.username,
    required super.id,
    required super.accountAvatar,
    required super.name,
  });

  factory AccountModel.fromJson(Map<String, dynamic> jsonData) {
    return AccountModel(
      username: jsonData['username'],
      id: jsonData['id'],
      accountAvatar: jsonData['tmdb'],
      name: jsonData['name'],
    );
  }
}
