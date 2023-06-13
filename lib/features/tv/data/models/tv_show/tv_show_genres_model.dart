import 'package:tmda/features/tv/domain/entities/tv_show/tv_show_genres.dart';

class TvShowGenresModel extends TvShowGenres {
  const TvShowGenresModel({required super.id, required super.name});

  factory TvShowGenresModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowGenresModel(
      id: jsonData['id'],
      name: jsonData['name'],
    );
  }
}
