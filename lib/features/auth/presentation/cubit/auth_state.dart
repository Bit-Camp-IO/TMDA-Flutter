part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthFailureState extends AuthState {}

class AuthenticationState extends AuthState {
  final Auth authData;

  const AuthenticationState(this.authData);

  @override
  List<Object> get props => [authData];
}
class AuthLoadingState extends AuthState {}

class AuthRegisterState extends AuthState {}
