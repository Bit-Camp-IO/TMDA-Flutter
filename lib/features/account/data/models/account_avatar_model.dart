import 'package:tmda/features/account/domain/entities/account_avatar.dart';

class AccountAvatarModel extends AccountAvatar{
  const AccountAvatarModel({required super.path});
  
  factory AccountAvatarModel.fromJson(Map<String, dynamic> jsonData){
    return AccountAvatarModel(path: jsonData['avatar_path'] ?? '');
  }
}