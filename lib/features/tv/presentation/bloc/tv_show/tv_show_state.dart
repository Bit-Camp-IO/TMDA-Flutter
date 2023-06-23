part of 'tv_show_bloc.dart';

class TvShowsState extends Equatable {
  final List<TvShow> airingTodayTvShows;
  final BlocState airingTodayState;
  final String airingTodayFailMessage;
  final List<TvShow> airingThisWeekTvShows;
  final BlocState airingThisWeekState;
  final String airingThisWeekFailMessage;
  final bool hasAiringThisWeekListReachedMax;
  final List<TvShow> popularTvShows;
  final BlocState popularTvShowsState;
  final String popularTvShowsFailMessage;
  final bool hasPopularListReachedMax;
  final List<TvShow> topRatedTvShows;
  final BlocState topRatedState;
  final bool hasTopRatedListReachedMax;
  final String topRatedFailMessage;

  const TvShowsState({
    this.airingTodayTvShows = const [],
    this.airingTodayState = BlocState.loading,
    this.airingTodayFailMessage = '',
    this.airingThisWeekTvShows = const [],
    this.airingThisWeekState = BlocState.loading,
    this.airingThisWeekFailMessage = '',
    this.hasAiringThisWeekListReachedMax = false,
    this.popularTvShows = const [],
    this.popularTvShowsState = BlocState.loading,
    this.popularTvShowsFailMessage = '',
    this.hasPopularListReachedMax = false,
    this.topRatedTvShows = const [],
    this.topRatedState = BlocState.loading,
    this.topRatedFailMessage = '',
    this.hasTopRatedListReachedMax = false,
  });

  TvShowsState copyWith({
    List<TvShow>? airingTodayTvShows,
    BlocState? airingTodayState,
    String? airingTodayFailMessage,
    List<TvShow>? airingThisWeekTvShows,
    BlocState? airingThisWeekState,
    String? airingThisWeekFailMessage,
    bool? hasAiringThisWeekListReachedMax,
    List<TvShow>? popularTvShows,
    BlocState? popularTvShowsState,
    String? popularTvShowsFailMessage,
    bool? hasPopularListReachedMax,
    List<TvShow>? topRatedTvShows,
    BlocState? topRatedState,
    String? topRatedFailMessage,
    bool? hasTopRatedListReachedMax,
  }) {
    return TvShowsState(
      airingTodayTvShows: airingTodayTvShows ?? this.airingTodayTvShows,
      airingTodayState: airingTodayState ?? this.airingTodayState,
      airingTodayFailMessage:
          airingTodayFailMessage ?? this.airingTodayFailMessage,
      airingThisWeekTvShows:
          airingThisWeekTvShows ?? this.airingThisWeekTvShows,
      airingThisWeekState: airingThisWeekState ?? this.airingThisWeekState,
      airingThisWeekFailMessage:
          airingThisWeekFailMessage ?? this.airingThisWeekFailMessage,
      hasAiringThisWeekListReachedMax: hasAiringThisWeekListReachedMax ??
          this.hasAiringThisWeekListReachedMax,
      popularTvShows: popularTvShows ?? this.popularTvShows,
      popularTvShowsState: popularTvShowsState ?? this.popularTvShowsState,
      popularTvShowsFailMessage:
          popularTvShowsFailMessage ?? this.popularTvShowsFailMessage,
      hasPopularListReachedMax:
          hasPopularListReachedMax ?? this.hasPopularListReachedMax,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedFailMessage: topRatedFailMessage ?? this.topRatedFailMessage,
      hasTopRatedListReachedMax:
          hasTopRatedListReachedMax ?? this.hasTopRatedListReachedMax
    );
  }

  @override
  List<Object?> get props => [
        airingTodayTvShows,
        airingTodayState,
        airingTodayFailMessage,
        airingThisWeekTvShows,
        airingThisWeekState,
        airingThisWeekFailMessage,
        hasAiringThisWeekListReachedMax,
        popularTvShows,
        popularTvShowsState,
        popularTvShowsFailMessage,
        hasPopularListReachedMax,
        topRatedTvShows,
        topRatedState,
        topRatedFailMessage,
        hasTopRatedListReachedMax
      ];
}
