import 'package:equatable/equatable.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';

import 'package:tmda/features/tv/domain/entities/tv_show_genres.dart';

class AccountWatchListTvShow extends Equatable {
  final String title;
  final int id;
  final String posterPath;
  final String firstAirDate;
  final String language;
  final dynamic voteAverage;
  final int voteCount;
  final List<TvShowGenres> genres;
  final TvShowAccountStates accountStates;

  const AccountWatchListTvShow({
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

  AccountWatchListTvShow copyWith({
    String? title,
    int? id,
    String? backDropPath,
    String? posterPath,
    String? firstAirDate,
    String? language,
    String? overview,
    dynamic voteAverage,
    int? voteCount,
    List<TvShowGenres>? genres,
    TvShowAccountStates? accountStates,
  }) {
    return AccountWatchListTvShow(
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
