import 'package:tmda/features/tv/data/models/tv_show_account_status_model.dart';
import 'package:tmda/features/tv/data/models/tv_show_genres_model.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';

class TvShowModel extends TvShow {
  const TvShowModel({
    required super.backDropPath,
    required super.posterPath,
    required super.title,
    required super.language,
    required super.overview,
    required super.voteAverage,
    required super.voteCount,
    required super.genres,
    required super.firstAirDate,
    required super.id,
    required super.accountStates,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> jsonData) {
    final List<Map<String, dynamic>> genresList = [
      {"id": 10759, "name": "Action"},
      {"id": 16, "name": "Animation"},
      {"id": 35, "name": "Comedy"},
      {"id": 80, "name": "Crime"},
      {"id": 99, "name": "Documentary"},
      {"id": 18, "name": "Drama"},
      {"id": 10751, "name": "Family"},
      {"id": 10762, "name": "Kids"},
      {"id": 9648, "name": "Mystery"},
      {"id": 10763, "name": "News"},
      {"id": 10764, "name": "Reality"},
      {"id": 10765, "name": "Sci-Fi"},
      {"id": 10766, "name": "Soap"},
      {"id": 10767, "name": "Talk"},
      {"id": 10768, "name": "War"},
      {"id": 37, "name": "Western"}
    ];
    List<dynamic> tvShowGenres = [];
    for (int genreId in jsonData['genre_ids']) {
      tvShowGenres
          .add(genresList.firstWhere((element) => element['id'] == genreId || element['id'] == 9648));
    }
    return TvShowModel(
      id: jsonData['id'],
      backDropPath: jsonData['backdrop_path'] ?? '',
      posterPath: jsonData['poster_path'] ?? '',
      title: jsonData['name'],
      language: jsonData['original_language'],
      overview: jsonData['overview'],
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genres: List<TvShowGenresModel>.from(
          tvShowGenres.map((jsonData) => TvShowGenresModel.fromJson(jsonData))),
      firstAirDate: jsonData['first_air_date'],
      accountStates: TvShowAccountStatesModel.fromJson(jsonData['account_status'] ?? {}),
    );
  }
}
