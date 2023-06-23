import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_account_status.dart';

class TvShowAccountStatusModel extends TvShowAccountStatus {
  const TvShowAccountStatusModel({
    super.isFavoriteMovie,
    required super.isInWatchList,
  });

  factory TvShowAccountStatusModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowAccountStatusModel(
      isFavoriteMovie: jsonData['favorite'] ?? false,
      isInWatchList: jsonData['watchlist'] ?? false,
    );
  }
}
