part of 'tv_show_details_cubit.dart';

class TvShowDetailsState extends Equatable {
  final TvShowDetails tvShowDetails;
  final BlocState tvShowDetailsState;
  final String tvShowDetailsFailMessage;
  final String getSimilarTvShowsFailMessage;
  final bool hasSimilarTvShowsListReachedMax;
  final String getRecommendedTvShowsFailMessage;
  final bool hasRecommendedTvShowsListReachedMax;
  const TvShowDetailsState({
    this.tvShowDetails = const TvShowDetails(),
    this.tvShowDetailsState = BlocState.loading,
    this.tvShowDetailsFailMessage = '',
    this.getSimilarTvShowsFailMessage = '',
    this.hasSimilarTvShowsListReachedMax = false,
    this.getRecommendedTvShowsFailMessage = '',
    this.hasRecommendedTvShowsListReachedMax = false,
  });
  TvShowDetailsState copyWith({
    TvShowDetails? tvShowDetails,
    BlocState? tvShowDetailsState,
    String? tvShowDetailsFailMessage,
    String? getSimilarTvShowsFailMessage,
    bool? hasSimilarTvShowsListReachedMax,
    String? getRecommendedTvShowsFailMessage,
    bool? hasRecommendedTvShowsListReachedMax,
  }) {
    return TvShowDetailsState(
      tvShowDetails: tvShowDetails ?? this.tvShowDetails,
      tvShowDetailsState: tvShowDetailsState ?? this.tvShowDetailsState,
      tvShowDetailsFailMessage: tvShowDetailsFailMessage ?? this.tvShowDetailsFailMessage,
      getSimilarTvShowsFailMessage: getSimilarTvShowsFailMessage ?? this.getSimilarTvShowsFailMessage,
      hasSimilarTvShowsListReachedMax: hasSimilarTvShowsListReachedMax ?? this.hasSimilarTvShowsListReachedMax,
      getRecommendedTvShowsFailMessage: getRecommendedTvShowsFailMessage ?? this.getRecommendedTvShowsFailMessage,
      hasRecommendedTvShowsListReachedMax: hasRecommendedTvShowsListReachedMax ?? this.hasRecommendedTvShowsListReachedMax,
    );
  }
  @override
  List<Object> get props => [
        tvShowDetails,
        tvShowDetailsFailMessage,
        tvShowDetailsState,
        getSimilarTvShowsFailMessage,
        hasSimilarTvShowsListReachedMax,
        hasRecommendedTvShowsListReachedMax,
        getRecommendedTvShowsFailMessage,
      ];
}
