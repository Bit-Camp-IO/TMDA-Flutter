import 'package:tmda/features/account/domain/entities/account_watchlist_genres.dart';

class AccountWatchListGenresModel extends AccountWatchListGenres{
  const AccountWatchListGenresModel({required super.name, required super.id});
  factory AccountWatchListGenresModel.fromJson(Map<String, dynamic> jsonData){
    return AccountWatchListGenresModel(name: jsonData['name'], id: jsonData['id']);
  }
}