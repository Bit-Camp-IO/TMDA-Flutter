import 'package:tmda/features/account/domain/entities/watchlist_genres.dart';

class WatchListGenresModel extends WatchListGenres{
  const WatchListGenresModel({required super.name, required super.id});
  factory WatchListGenresModel.fromJson(Map<String, dynamic> jsonData){
    return WatchListGenresModel(name: jsonData['name'], id: jsonData['id']);
  }
}