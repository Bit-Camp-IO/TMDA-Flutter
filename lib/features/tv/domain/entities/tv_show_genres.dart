import 'package:equatable/equatable.dart';

class TvShowGenres extends Equatable {
  final int id;
  final String name;

  const TvShowGenres({required this.id, required this.name});
  @override
  List<Object?> get props => [];
}
