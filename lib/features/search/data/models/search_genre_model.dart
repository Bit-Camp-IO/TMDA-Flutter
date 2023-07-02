import 'package:tmda/features/search/domain/entities/search_genre.dart';

class SearchGenreModel extends SearchGenre{
  const SearchGenreModel({required super.name, required super.id});

  factory SearchGenreModel.fromJson(Map<String, dynamic> jsonData){
    return SearchGenreModel(name: jsonData['name'], id: jsonData['id']);
  }
}