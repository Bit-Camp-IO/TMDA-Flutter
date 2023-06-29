import 'package:tmda/features/account/domain/entities/account_avatar.dart';

class AccountAvatarModel extends AccountAvatar{
  const AccountAvatarModel({required super.avatarPath});
  
  factory AccountAvatarModel.fromJson(Map<String, dynamic> jsonData){
    return AccountAvatarModel(avatarPath: jsonData['avatar_path'] ?? '');
  }
}