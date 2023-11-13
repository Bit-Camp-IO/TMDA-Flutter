import 'package:equatable/equatable.dart';
import 'package:tmda/features/shared/domain/entities/account_states.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_cast.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_network.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_production_country.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_reviews.dart';
import 'package:tmda/features/tv/domain/entities/tv_show_video.dart';
import 'package:tmda/features/shared/domain/entities/tv_show.dart';
import 'package:tmda/features/shared/domain/entities/tv_show_genres.dart';

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
  final List<TvShowReviews> reviews;

  const TvShowDetails({
    this.id = 0,
    this. backDropPath = '',
    this.posterPath =  '',
    this.overview = '',
    this.firstAirDate =  '',
    this.lastAirDate =  '',
    this.numberOfEpisodes =  0,
    this.numberOfSeasons =  0,
    this.tvShowLanguage = '',
    this.title = '',
    this.voteAverage = 0,
    this.popularity = 0,
    this.tvShowProductionCountry = const TvShowProductionCountry(countryCode: '', countryName: ''),
    this.network =  const TvShowNetwork(id: 0, name: ''),
    this.genres = const [],
    this.tvShowVideo = const TvShowVideo(name: '', key: '', videoType: ''),
    this.voteCount =  0,
    this.similarTvShows = const [],
    this.recommendedTvShows = const [],
    this.cast = const[],
    this.reviews = const []
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
        voteCount,
        similarTvShows,
        recommendedTvShows,
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
    AccountStates? status,
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
      reviews: reviews ?? this.reviews,
    );
  }
}
