part of 'account_bloc.dart';

class AccountState extends Equatable {
  final Account account;
  final List<WatchListMovie> watchListMovies;
  final List<WatchListTvShow> watchListTvShows;
  final BlocState accountState;
  final String accountFailMessage;
  final UserAccountState userAccountState;
  const AccountState({
    this.account = const Account(
      accountAvatar: AccountAvatar(avatarPath: ''),
      id: 0,
      username: '',
      name: '',
    ),
    this.watchListMovies = const [],
    this.watchListTvShows = const [],
    this.accountState = BlocState.loading,
    this.accountFailMessage = '',
    this.userAccountState = UserAccountState.loggedIn,
  });

  AccountState copyWith({
    Account? account,
    List<WatchListMovie>? watchListMovies,
    List<WatchListTvShow>? watchListTvShows,
    BlocState? accountState,
    String? accountFailMessage,
    UserAccountState? userAccountState,
  }) {
    return AccountState(
      account: account ?? this.account,
      watchListMovies: watchListMovies ?? this.watchListMovies,
      watchListTvShows: watchListTvShows ?? this.watchListTvShows,
      accountState: accountState ?? this.accountState,
      accountFailMessage: accountFailMessage ?? this.accountFailMessage,
      userAccountState: userAccountState ?? this.userAccountState,
    );
  }

  @override
  List<Object?> get props => [
        account,
        watchListMovies,
        watchListTvShows,
        accountState,
        accountFailMessage,
        userAccountState,
      ];
}
