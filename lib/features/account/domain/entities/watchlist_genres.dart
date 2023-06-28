import 'package:equatable/equatable.dart';

class WatchListGenres extends Equatable {
  final int id;
  final String name;
  const WatchListGenres({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [id, name];
}
