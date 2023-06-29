part of 'account_see_all_bloc.dart';

class AccountSeeAllState extends Equatable {
  final List<WatchListMovie> moviesWatchList;
  final List<WatchListTvShow> tvShowsWatchList;
  final BlocState seeAllState;
  final String seeAllFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final String updateStatesFailMessage;

  const AccountSeeAllState({
    this.moviesWatchList = const [],
    this.tvShowsWatchList = const [],
    this.seeAllState = BlocState.loading,
    this.seeAllFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.updateStatesFailMessage = '',
  });

  AccountSeeAllState copyWith({
    List<WatchListMovie>? moviesWatchList,
    List<WatchListTvShow>? tvShowsWatchList,
    BlocState? seeAllState,
    String? seeAllFailMessage,
    String? addOrRemoveFromWatchListFailMessage,
    String? updateStatesFailMessage,
  }) {
    return AccountSeeAllState(
      moviesWatchList: moviesWatchList ?? this.moviesWatchList,
      tvShowsWatchList: tvShowsWatchList ?? this.tvShowsWatchList,
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
        tvShowsWatchList,
        seeAllState,
        seeAllFailMessage,
        addOrRemoveFromWatchListFailMessage,
        updateStatesFailMessage,
      ];
}
