import 'package:equatable/equatable.dart';
import 'package:tmda/features/account/domain/entities/account_states.dart';
import 'package:tmda/features/account/domain/entities/watchlist_genres.dart';

class WatchListTvShow extends Equatable {
  final String title;
  final int id;
  final String posterPath;
  final String firstAirDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<WatchListGenres> genres;
  final AccountStates accountStates;

  const WatchListTvShow({
    required this.title,
    required this.id,
    required this.posterPath,
    required this.language,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    required this.firstAirDate,
    required this.accountStates,
  });

  WatchListTvShow copyWith({
    String? title,
    int? id,
    String? backDropPath,
    String? posterPath,
    String? firstAirDate,
    String? language,
    String? overview,
    dynamic voteAverage,
    int? voteCount,
    List<WatchListGenres>? genres,
    AccountStates? accountStates,
  }) {
    return WatchListTvShow(
      title: title ?? this.title,
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      language: language ?? this.language,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      genres: genres ?? this.genres,
      accountStates: accountStates ?? this.accountStates,
    );
  }

  @override
  List<Object?> get props => [
    id,
    posterPath,
    title,
    language,
    voteAverage,
    voteCount,
    genres,
    firstAirDate,
    accountStates
  ];
}
