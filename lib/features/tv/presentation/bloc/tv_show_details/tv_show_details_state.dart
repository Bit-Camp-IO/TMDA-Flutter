part of 'tv_show_details_bloc.dart';

class TvShowDetailsState extends Equatable {
  final TvShowDetails tvShowDetails;
  final BlocState tvShowDetailsState;
  final String tvShowDetailsFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final String getSimilarTvShowsFailMessage;
  final bool hasSimilarTvShowsListReachedMax;
  final String getRecommendedTvShowsFailMessage;
  final bool hasRecommendedTvShowsListReachedMax;
  final List<List<SeasonEpisode>> allSeasonsEpisodes;
  final BlocState seasonEpisodesState;
  final String seasonEpisodesFailMessage;
  final int bodyTabIndex;
  final int seasonsTabIndex;
  final double animatedHeight;
  const TvShowDetailsState({
    this.tvShowDetails = const TvShowDetails(
      tvShowId: 0,
      backDropPath: '',
      posterPath: '',
      overview: '',
      firstAirDate: '',
      lastAirDate: '',
      numberOfEpisodes: 0,
      numberOfSeasons: 0,
      tvShowLanguage: '',
      title: '',
      voteAverage: 0,
      popularity: 0,
      tvShowProductionCountry:
          TvShowProductionCountry(countryCode: '', countryName: ''),
      network: TvShowNetwork(id: 0, name: ''),
      seasons: [],
      genres: [],
      tvShowVideo: TvShowVideo(name: '', key: '', videoType: ''),
      voteCount: 0,
      similarTvShows: [],
      recommendedTvShows: [],
      cast: [],
      status: TvShowAccountStates(isInWatchList: false),
      reviews: []
    ),
    this.tvShowDetailsState = BlocState.loading,
    this.tvShowDetailsFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.getSimilarTvShowsFailMessage = '',
    this.hasSimilarTvShowsListReachedMax = false,
    this.getRecommendedTvShowsFailMessage = '',
    this.hasRecommendedTvShowsListReachedMax = false,
    this.allSeasonsEpisodes = const [],
    this.seasonEpisodesState = BlocState.loading,
    this.seasonEpisodesFailMessage = '',
    this.bodyTabIndex = 0,
    this.seasonsTabIndex = 0,
    this.animatedHeight = 420,
  });
  TvShowDetailsState copyWith({
    TvShowDetails? tvShowDetails,
    BlocState? tvShowDetailsState,
    String? tvShowDetailsFailMessage,
    String? addOrRemoveFromWatchListFailMessage,
    String? getSimilarTvShowsFailMessage,
    bool? hasSimilarTvShowsListReachedMax,
    String? getRecommendedTvShowsFailMessage,
    bool? hasRecommendedTvShowsListReachedMax,
    List<List<SeasonEpisode>>? allSeasonsEpisodes,
    BlocState? seasonEpisodesState,
    String? seasonEpisodesFailMessage,
    int? bodyTabIndex,
    int? seasonsTabIndex,
    double? animatedHeight,
  }) {
    return TvShowDetailsState(
      tvShowDetails: tvShowDetails ?? this.tvShowDetails,
      tvShowDetailsState: tvShowDetailsState ?? this.tvShowDetailsState,
      tvShowDetailsFailMessage: tvShowDetailsFailMessage ?? this.tvShowDetailsFailMessage,
      addOrRemoveFromWatchListFailMessage: addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      getSimilarTvShowsFailMessage: getSimilarTvShowsFailMessage ?? this.getSimilarTvShowsFailMessage,
      hasSimilarTvShowsListReachedMax: hasSimilarTvShowsListReachedMax ?? this.hasSimilarTvShowsListReachedMax,
      getRecommendedTvShowsFailMessage: getRecommendedTvShowsFailMessage ?? this.getRecommendedTvShowsFailMessage,
      hasRecommendedTvShowsListReachedMax: hasRecommendedTvShowsListReachedMax ?? this.hasRecommendedTvShowsListReachedMax,
      allSeasonsEpisodes: allSeasonsEpisodes ?? this.allSeasonsEpisodes,
      seasonEpisodesState: seasonEpisodesState ?? this.seasonEpisodesState,
      seasonEpisodesFailMessage: seasonEpisodesFailMessage ?? this.seasonEpisodesFailMessage,
      bodyTabIndex: bodyTabIndex ?? this.bodyTabIndex,
      seasonsTabIndex: seasonsTabIndex ?? this.seasonsTabIndex,
      animatedHeight: animatedHeight ?? this.animatedHeight
    );
  }
  @override
  List<Object> get props => [
        tvShowDetails,
        tvShowDetailsFailMessage,
        tvShowDetailsState,
        addOrRemoveFromWatchListFailMessage,
        getSimilarTvShowsFailMessage,
        hasSimilarTvShowsListReachedMax,
        hasRecommendedTvShowsListReachedMax,
        getRecommendedTvShowsFailMessage,
        allSeasonsEpisodes,
        seasonEpisodesState,
        seasonEpisodesFailMessage,
        bodyTabIndex,
        seasonsTabIndex,
        animatedHeight
      ];
}
