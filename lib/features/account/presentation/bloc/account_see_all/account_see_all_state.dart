part of 'account_see_all_bloc.dart';

class AccountSeeAllState extends Equatable {
  final List<WatchListMovie> moviesWatchList;
  final bool hasMoviesWatchListReachedMax;
  final List<WatchListTvShow> tvShowsWatchList;
  final bool hasTvShowsWatchListReachedMax;
  final BlocState seeAllState;
  final String seeAllFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final String updateStatesFailMessage;

  const AccountSeeAllState({
    this.moviesWatchList = const [],
    this.hasMoviesWatchListReachedMax = false,
    this.tvShowsWatchList = const [],
    this.hasTvShowsWatchListReachedMax = false,
    this.seeAllState = BlocState.loading,
    this.seeAllFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.updateStatesFailMessage = '',
  });

  AccountSeeAllState copyWith({
    List<WatchListMovie>? moviesWatchList,
    bool? hasMoviesWatchListReachedMax,
    List<WatchListTvShow>? tvShowsWatchList,
    bool? hasTvShowsWatchListReachedMax,
    BlocState? seeAllState,
    String? seeAllFailMessage,
    String? addOrRemoveFromWatchListFailMessage,
    String? updateStatesFailMessage,
  }) {
    return AccountSeeAllState(
      moviesWatchList: moviesWatchList ?? this.moviesWatchList,
      hasMoviesWatchListReachedMax: hasMoviesWatchListReachedMax ?? this.hasMoviesWatchListReachedMax,
      tvShowsWatchList: tvShowsWatchList ?? this.tvShowsWatchList,
      hasTvShowsWatchListReachedMax: hasTvShowsWatchListReachedMax ?? this.hasTvShowsWatchListReachedMax,
      seeAllState: seeAllState ?? this.seeAllState,
      seeAllFailMessage: seeAllFailMessage ?? this.seeAllFailMessage,
      addOrRemoveFromWatchListFailMessage:
      addOrRemoveFromWatchListFailMessage ?? this.addOrRemoveFromWatchListFailMessage,
      updateStatesFailMessage:
      updateStatesFailMessage ?? this.updateStatesFailMessage,
    );
  }

  @override
  List<Object?> get props =>
      [
        moviesWatchList,
        hasMoviesWatchListReachedMax,
        tvShowsWatchList,
        hasTvShowsWatchListReachedMax,
        seeAllState,
        seeAllFailMessage,
        addOrRemoveFromWatchListFailMessage,
        updateStatesFailMessage,
      ];
}
