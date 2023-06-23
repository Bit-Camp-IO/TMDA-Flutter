import 'package:tmda/features/tv/data/models/tv_details/tv_show_account_status_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_cast_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_network_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_production_countries_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_reviews_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_seasons_model.dart';
import 'package:tmda/features/tv/data/models/tv_details/tv_show_video_model.dart';
import 'package:tmda/features/tv/data/models/tv_show/tv_show_genres_model.dart';
import 'package:tmda/features/tv/data/models/tv_show/tv_show_model.dart';
import 'package:tmda/features/tv/domain/entities/tv_details/tv_show_details.dart';

class TvShowDetailsModel extends TvShowDetails {
  const TvShowDetailsModel({
    required super.tvShowId,
    required super.backDropPath,
    required super.posterPath,
    required super.overview,
    required super.firstAirDate,
    required super.lastAirDate,
    required super.numberOfEpisodes,
    required super.numberOfSeasons,
    required super.tvShowLanguage,
    required super.title,
    required super.voteAverage,
    required super.popularity,
    required super.tvShowProductionCountry,
    required super.network,
    required super.seasons,
    required super.genres,
    required super.tvShowVideo,
    required super.voteCount,
    required super.cast,
    required super.recommendedTvShows,
    required super.similarTvShows,
    required super.status,
    required super.reviews,
  });

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return TvShowDetailsModel(
      tvShowId: jsonData['id'],
      backDropPath: jsonData['backdrop_path'] ?? '',
      posterPath: jsonData['poster_path'] ?? '',
      overview: jsonData['overview'],
      firstAirDate: jsonData['first_air_date'],
      lastAirDate: jsonData['last_air_date'],
      numberOfEpisodes: jsonData['number_of_episodes'],
      numberOfSeasons: jsonData['number_of_seasons'],
      tvShowLanguage: jsonData['original_language'],
      title: jsonData['name'],
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      popularity: jsonData['popularity'],
      tvShowProductionCountry: TvShowProductionCountryModel.fromJson(
        jsonData['production_countries'],
      ),
      network: TvShowNetworkModel.fromJson(jsonData['networks']),
      seasons: List<TvShowSeasonsModel>.from(
        jsonData['seasons'].map(
              (jsonData) => TvShowSeasonsModel.fromJson(jsonData),
        ),
      ),
      genres: List<TvShowGenresModel>.from(
        jsonData['genres'].map(
              (jsonData) => TvShowGenresModel.fromJson(jsonData),
        ),
      ),
      tvShowVideo: TvShowVideoModel.fromJson(
        jsonData['videos']['results'],
      ),
      cast: List<TvShowCastModel>.from(
        jsonData['credits']['cast'].map((jsonData) =>
            TvShowCastModel.fromJson(jsonData),
        ),
      ),
      recommendedTvShows: List<TvShowModel>.from(
        jsonData['recommendations']['results'].map((jsonData) =>
            TvShowModel.fromJson(jsonData),
        ),
      ),
      similarTvShows: List<TvShowModel>.from(
        jsonData['similar']['results'].map((jsonData) =>
            TvShowModel.fromJson(jsonData),
        ),
      ),
      status: TvShowAccountStatusModel.fromJson(jsonData['account_states']),
      reviews: List<TvShowReviewsModel>.from(
        jsonData['reviews']['results'].map((jsonData) =>
            TvShowReviewsModel.fromJson(jsonData),
        ),
      ),
    );
  }
}
