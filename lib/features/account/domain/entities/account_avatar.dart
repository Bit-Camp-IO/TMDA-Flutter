import 'package:equatable/equatable.dart';

class AccountAvatar extends Equatable{
  final String avatarPath;
  const AccountAvatar({required this.avatarPath});


  @override
  List<Object?> get props => [avatarPath];
}