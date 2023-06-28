part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
  @override
  List<Object?> get props => [];
}

class GetAccountDetailsEvent extends AccountEvent{}

class GetAccountMoviesWatchListEvent extends AccountEvent{}

class GetAccountTvShowsWatchListEvent extends AccountEvent{}

class AccountLogoutEvent extends AccountEvent{}


