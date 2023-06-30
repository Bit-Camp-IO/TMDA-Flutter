part of 'account_see_all_bloc.dart';

class AccountSeeAllState extends Equatable {
  final List<WatchListMovie> moviesWatchList;
  final List<WatchListTvShow> tvShowsWatchList;
  final BlocState seeAllState;
  final bool isWatchListEmpty;
  final String seeAllFailMessage;
  final String addOrRemoveFromWatchListFailMessage;
  final String updateStatesFailMessage;

  const AccountSeeAllState({
    this.moviesWatchList = const [],
    this.tvShowsWatchList = const [],
    this.isWatchListEmpty = true,
    this.seeAllState = BlocState.loading,
    this.seeAllFailMessage = '',
    this.addOrRemoveFromWatchListFailMessage = '',
    this.updateStatesFailMessage = '',
  });

  AccountSeeAllState copyWith({
    List<WatchListMovie>? moviesWatchList,
    List<WatchListTvShow>? tvShowsWatchList,
    bool? isWatchListEmpty,
    BlocState? seeAllState,
    String? seeAllFailMessage,
    String? addOrRemoveFromWatchListFailMessage,
    String? updateStatesFailMessage,
  }) {
    return AccountSeeAllState(
      moviesWatchList: moviesWatchList ?? this.moviesWatchList,
      tvShowsWatchList: tvShowsWatchList ?? this.tvShowsWatchList,
      isWatchListEmpty: isWatchListEmpty ?? this.isWatchListEmpty,
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
        isWatchListEmpty,
        seeAllState,
        seeAllFailMessage,
        addOrRemoveFromWatchListFailMessage,
        updateStatesFailMessage,
      ];
}
