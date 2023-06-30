part of 'tv_show_bloc.dart';

class TvShowsState extends Equatable {
  final BlocState tvShowsState;
  final String tvShowsFailMessage;
  final List<TvShow> airingTodayTvShows;
  final List<TvShow> airingThisWeekTvShows;
  final List<TvShow> popularTvShows;
  final List<TvShow> topRatedTvShows;


  const TvShowsState({
    this.tvShowsState = BlocState.loading,
    this.tvShowsFailMessage = '',
    this.airingTodayTvShows = const [],
    this.airingThisWeekTvShows = const [],
    this.popularTvShows = const [],
    this.topRatedTvShows = const [],
  });

  TvShowsState copyWith({
    BlocState? tvShowsState,
    String? tvShowsFailMessage,
    List<TvShow>? airingTodayTvShows,
    List<TvShow>? airingThisWeekTvShows,
    List<TvShow>? topRatedTvShows,
    List<TvShow>? popularTvShows,
  }) {
    return TvShowsState(
      tvShowsState: tvShowsState ?? this.tvShowsState,
      tvShowsFailMessage: tvShowsFailMessage ?? this.tvShowsFailMessage,
      airingTodayTvShows: airingTodayTvShows ?? this.airingTodayTvShows,
      airingThisWeekTvShows:
          airingThisWeekTvShows ?? this.airingThisWeekTvShows,
      popularTvShows: popularTvShows ?? this.popularTvShows,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
    );
  }

  @override
  List<Object?> get props => [
        airingTodayTvShows,
        airingThisWeekTvShows,
        popularTvShows,
        topRatedTvShows,
      ];
}
