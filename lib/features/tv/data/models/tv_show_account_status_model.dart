import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';

class TvShowAccountStatesModel extends TvShowAccountStates {
  const TvShowAccountStatesModel({
    super.tvShowId,
    required super.isInWatchList,
  });

  factory TvShowAccountStatesModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowAccountStatesModel(
      tvShowId: jsonData['tv_show_id'] ?? 0,
      isInWatchList: jsonData['watchlist'] ?? false,
    );
  }
}
