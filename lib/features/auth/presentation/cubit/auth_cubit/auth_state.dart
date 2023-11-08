part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthenticatedState extends AuthState {
  final Auth authData;

  const AuthenticatedState(this.authData);

  @override
  List<Object> get props => [authData];
}

class UnAuthenticatedState extends AuthState {}
