import 'package:tmda/features/movie/domain/entities/movie_account_states.dart';

class MovieAccountStatesModel extends MovieAccountStates {
  const MovieAccountStatesModel({
    super.movieId,
    required super.inWatchList,
  });

  factory MovieAccountStatesModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieAccountStatesModel(
      inWatchList: jsonData['watchlist'] ?? false,
      movieId: jsonData['movie_id'] ?? 0,
    );
  }
}
