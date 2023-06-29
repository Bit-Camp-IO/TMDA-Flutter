import 'package:equatable/equatable.dart';
import 'package:tmda/features/account/domain/entities/account_avatar.dart';

class Account extends Equatable {
  final String name;
  final String username;
  final int id;
  final AccountAvatar accountAvatar;

  const Account({
    required this.name,
    required this.username,
    required this.id,
    required this.accountAvatar,
  });

  @override
  List<Object?> get props => [
    name,
    username,
    accountAvatar,
    id,
  ];
}
