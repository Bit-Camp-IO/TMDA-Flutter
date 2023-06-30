import 'package:equatable/equatable.dart';

class AccountAvatar extends Equatable{
  final String path;
  const AccountAvatar({required this.path});


  @override
  List<Object?> get props => [path];
}