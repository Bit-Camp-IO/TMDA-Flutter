import 'package:tmda/features/movie/domain/entities/movie_details/movie_account_states.dart';

class MovieAccountStatesModel extends MovieAccountStatus {
  const MovieAccountStatesModel({
    super.isFavoriteMovie,
    required super.inWatchList,
  });

  factory MovieAccountStatesModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieAccountStatesModel(
      isFavoriteMovie: jsonData['favorite'] ?? false,
      inWatchList: jsonData['watchlist'] ?? false,
    );
  }
}
