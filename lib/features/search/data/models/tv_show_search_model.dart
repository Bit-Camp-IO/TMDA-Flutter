import 'package:tmda/features/account/data/models/account_states_model.dart';
import 'package:tmda/features/account/data/models/watchlist_genres_model.dart';
import 'package:tmda/features/search/data/models/search_content_states_model.dart';
import 'package:tmda/features/search/data/models/search_genre_model.dart';
import 'package:tmda/features/search/domain/entities/tv_show_search.dart';

class SearchTvShowModel extends TvShowSearch {
  const SearchTvShowModel({
    required super.title,
    required super.id,
    required super.posterPath,
    required super.language,
    required super.voteAverage,
    required super.voteCount,
    required super.genres,
    required super.firstAirDate,
    required super.contentStates,
  });

  factory SearchTvShowModel.fromJson(Map<String, dynamic> jsonData) {
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
    List<Map<String, dynamic>> tvShowGenres = genresList.where((genre) => jsonData['genre_ids'].contains(genre['id'])).toList();

    return SearchTvShowModel(
      id: jsonData['id'],
      posterPath: jsonData['poster_path'] ?? '',
      title: jsonData['name'],
      language: jsonData['original_language'],
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      genres: List<SearchGenreModel>.from(
          tvShowGenres.map((jsonData) => SearchGenreModel.fromJson(jsonData))),
      firstAirDate: jsonData['first_air_date'],
      contentStates: SearchContentStatesModel.fromJson(jsonData['account_status']),
    );
  }
}
