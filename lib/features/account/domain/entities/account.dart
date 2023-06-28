import 'package:equatable/equatable.dart';
import 'package:tmda/features/account/domain/entities/account_avatar.dart';

class Account extends Equatable {
  final String? name;
  final String username;
  final int accountId;
  final AccountAvatar accountAvatar;

  const Account({
    this.name,
    required this.username,
    required this.accountId,
    required this.accountAvatar,
  });

  @override
  List<Object?> get props => [
    name,
    username,
    accountAvatar,
    accountId,
  ];
}
