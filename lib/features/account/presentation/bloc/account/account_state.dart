part of 'account_bloc.dart';

class AccountState extends Equatable {
  final Account account;
  final List<WatchListMovie> watchListMovies;
  final BlocState moviesWatchListState;
  final List<WatchListTvShow> watchListTvShows;
  final BlocState tvShowsWatchListState;
  final BlocState accountTabState;
  final String accountFailMessage;
  final UserAccountState userAccountState;
  const AccountState({
    this.account = const Account(
      accountAvatar: AccountAvatar(path: ''),
      id: 0,
      username: '',
      name: '',
    ),
    this.watchListMovies = const [],
    this.moviesWatchListState = BlocState.loading,
    this.tvShowsWatchListState = BlocState.loading,
    this.watchListTvShows = const [],
    this.accountTabState = BlocState.loading,
    this.accountFailMessage = '',
    this.userAccountState = UserAccountState.loggedIn,
  });

  AccountState copyWith({
    Account? account,
    List<WatchListMovie>? watchListMovies,
    BlocState? moviesWatchListState,
    List<WatchListTvShow>? watchListTvShows,
    BlocState? tvShowsWatchListState,
    BlocState? accountTabState,
    String? accountFailMessage,
    UserAccountState? userAccountState,
  }) {
    return AccountState(
      account: account ?? this.account,
      watchListMovies: watchListMovies ?? this.watchListMovies,
      moviesWatchListState: moviesWatchListState ?? this.moviesWatchListState,
      watchListTvShows: watchListTvShows ?? this.watchListTvShows,
      tvShowsWatchListState: tvShowsWatchListState ?? this.tvShowsWatchListState,
      accountTabState: accountTabState ?? this.accountTabState,
      accountFailMessage: accountFailMessage ?? this.accountFailMessage,
      userAccountState: userAccountState ?? this.userAccountState,
    );
  }

  @override
  List<Object?> get props => [
        account,
        watchListMovies,
        watchListTvShows,
        accountTabState,
        accountFailMessage,
        userAccountState,
      ];
}
