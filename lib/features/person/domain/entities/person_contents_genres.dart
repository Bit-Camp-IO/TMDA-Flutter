import 'package:equatable/equatable.dart';

class PersonContentsGenres extends Equatable{
  final int id;
  final String name;

  const PersonContentsGenres({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}