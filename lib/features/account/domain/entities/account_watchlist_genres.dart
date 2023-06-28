import 'package:equatable/equatable.dart';

class AccountWatchListGenres extends Equatable {
  final int id;
  final String name;
  const AccountWatchListGenres({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [id, name];
}
