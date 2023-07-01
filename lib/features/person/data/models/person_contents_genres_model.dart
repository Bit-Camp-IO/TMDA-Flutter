import 'package:tmda/features/person/domain/entities/person_contents_genres.dart';

class PersonContentsGenresModel extends PersonContentsGenres{
  const PersonContentsGenresModel({required super.name, required super.id});

  factory PersonContentsGenresModel.fromJson(Map<String, dynamic> jsonData){
    return PersonContentsGenresModel(name: jsonData['name'], id: jsonData['id']);
  }
}