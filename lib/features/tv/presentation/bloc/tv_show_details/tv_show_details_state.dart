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
  final int bodyTabIndex;
  final int seasonsTabIndex;
  final double animatedHeight;
  const TvShowDetailsState({
    this.tvShowDetails = const TvShowDetails(

    ),
    this.tvShowDetailsState = BlocState.loading,
    this.tvShowDetailsFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.getSimilarTvShowsFailMessage = '',
    this.hasSimilarTvShowsListReachedMax = false,
    this.getRecommendedTvShowsFailMessage = '',
    this.hasRecommendedTvShowsListReachedMax = false,
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
        bodyTabIndex,
        seasonsTabIndex,
        animatedHeight
      ];
}
