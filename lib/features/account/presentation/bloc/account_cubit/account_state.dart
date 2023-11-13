part of 'account_bloc.dart';

class AccountState extends Equatable {
  final Account account;
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
    this.accountTabState = BlocState.loading,
    this.accountFailMessage = '',
    this.userAccountState = UserAccountState.loggedIn,
  });

  AccountState copyWith({
    Account? account,
    BlocState? accountTabState,
    String? accountFailMessage,
    UserAccountState? userAccountState,
  }) {
    return AccountState(
      account: account ?? this.account,
      accountTabState: accountTabState ?? this.accountTabState,
      accountFailMessage: accountFailMessage ?? this.accountFailMessage,
      userAccountState: userAccountState ?? this.userAccountState,
    );
  }

  @override
  List<Object?> get props => [
        account,
        accountTabState,
        accountFailMessage,
        userAccountState,
      ];
}
