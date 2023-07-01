// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:tmda/features/tv/domain/entities/tv_show_account_states.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_cast.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_network.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_production_country.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_reviews.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_seasons.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_video.dart';
import 'package:tmda/features/tv/domain/entities/tv_show.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_genres.dart';

class TvShowDetails extends Equatable {
  final int id;
  final String backDropPath;
  final String posterPath;
  final String overview;
  final String firstAirDate;
  final String lastAirDate;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String tvShowLanguage;
  final String title;
  final double voteAverage;
  final int voteCount;
  final dynamic popularity;
  final TvShowProductionCountry tvShowProductionCountry;
  final List<TvShowGenres> genres;
  final List<TvShow> similarTvShows;
  final List<TvShow> recommendedTvShows;
  final List<TvShowCast> cast;
  final TvShowVideo tvShowVideo;
  final TvShowNetwork network;
  final TvShowAccountStates status;
  final List<TvShowSeasons> seasons;
  final List<TvShowReviews> reviews;

  const TvShowDetails({
    required this.id,
    required this.backDropPath,
    required this.posterPath,
    required this.overview,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.tvShowLanguage,
    required this.title,
    required this.voteAverage,
    required this.popularity,
    required this.tvShowProductionCountry,
    required this.network,
    required this.seasons,
    required this.genres,
    required this.tvShowVideo,
    required this.voteCount,
    required this.similarTvShows,
    required this.recommendedTvShows,
    required this.cast,
    required this.status,
    required this.reviews
  });

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        overview,
        firstAirDate,
        lastAirDate,
        numberOfEpisodes,
        numberOfSeasons,
        title,
        voteAverage,
        genres,
        tvShowVideo,
        tvShowProductionCountry,
        tvShowLanguage,
        network,
        seasons,
        voteCount,
        similarTvShows,
        recommendedTvShows,
        status,
        reviews
      ];

  TvShowDetails copyWith({
    int? id,
    String? backDropPath,
    String? posterPath,
    String? overview,
    String? firstAirDate,
    String? lastAirDate,
    int? numberOfEpisodes,
    int? numberOfSeasons,
    String? tvShowLanguage,
    String? title,
    double? voteAverage,
    int? voteCount,
    dynamic popularity,
    TvShowProductionCountry? tvShowProductionCountry,
    List<TvShowGenres>? genres,
    List<TvShow>? similarTvShows,
    List<TvShow>? recommendedTvShows,
    List<TvShowCast>? cast,
    TvShowVideo? tvShowVideo,
    TvShowNetwork? network,
    TvShowAccountStates? status,
    List<TvShowSeasons>? seasons,
    List<TvShowReviews>? reviews,
  }) {
    return TvShowDetails(
      id: id ?? this.id,
      backDropPath: backDropPath ?? this.backDropPath,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      lastAirDate: lastAirDate ?? this.lastAirDate,
      numberOfEpisodes: numberOfEpisodes ?? this.numberOfEpisodes,
      numberOfSeasons: numberOfSeasons ?? this.numberOfSeasons,
      tvShowLanguage: tvShowLanguage ?? this.tvShowLanguage,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      popularity: popularity ?? this.popularity,
      tvShowProductionCountry: tvShowProductionCountry ?? this.tvShowProductionCountry,
      genres: genres ?? this.genres,
      similarTvShows: similarTvShows ?? this.similarTvShows,
      recommendedTvShows: recommendedTvShows ?? this.recommendedTvShows,
      cast: cast ?? this.cast,
      tvShowVideo: tvShowVideo ?? this.tvShowVideo,
      network: network ?? this.network,
      status: status ?? this.status,
      seasons: seasons ?? this.seasons,
      reviews: reviews ?? this.reviews,
    );
  }
}
